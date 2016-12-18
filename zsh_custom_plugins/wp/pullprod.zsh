#!/bin/zsh

#variables
localroot=$(wp cli info --format=json | jq '[.["project_config_path"]|rtrimstr("/wp-cli.local.yml")]' | tr -d "[:space:][\"]")
localdb=$(wp eval 'echo DB_NAME;')
localurl=$(wp option get siteurl)
localuploaddir=$(wp eval '$uploaddir=wp_get_upload_dir();echo $uploaddir["basedir"];')
prodssh=$(wp cli alias --format=json | jq '.["@prod"].ssh' | tr -d "[\"]")
proddb=$(wp @prod eval 'echo DB_NAME;')
produrl=$(wp @prod option get siteurl)
produploaddir=$(wp @prod eval '$uploaddir = wp_get_upload_dir(); echo $uploaddir["basedir"];')

# echo "** LOCAL ROOT IS $localroot **"
# echo "** BACKUP PATH IS IS $localroot/backup.$localdb.sql.gz **"

# check for existing local backup
if [[ -f $localroot/backup.$localdb.sql.gz ]]; then
  echo "Existing local backup backup.$localdb.sql found. Deleting…"
  rm -rf $localroot/backup.$localdb.sql.gz
fi

# make a backup of the current local database
echo "Backing up local db to backup.$localdb.sql.gz"
wp db export - | gzip > "$localroot/backup.$localdb.sql.gz"
wp db reset --yes

# connect to remote site and ssh the remote database down to our local directory
echo "Copying production database to $proddb.sql."
wp @prod db export - | gzip > $localroot/$proddb.sql.gz
gzcat $localroot/$proddb.sql.gz | wp db import -

# database is now imported so we can delete it
rm -rf $localroot/$proddb.sql

# update database if we need it
wp core update-db

# search-replace url in db
echo "Replacing '$produrl' with '$localurl' in db."
wp search-replace "$produrl" "$localurl"

# content sync
echo "Syncing content from $prodssh:$produploaddir to $localuploaddir"
rsync -zr "$prodssh:$produploaddir/*" $localuploaddir/

echo "All done, enjoy!"
