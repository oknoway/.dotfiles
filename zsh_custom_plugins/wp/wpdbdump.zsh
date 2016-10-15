#!/bin/zsh

#variables
localroot=$(wp cli info --format=json | jq '[.["project_config_path"]|rtrimstr("/wp-cli.local.yml")]' | tr -d "[:space:][\"]")
localdb=$(wp eval 'echo DB_NAME;')

# echo "** LOCAL ROOT IS $localroot **"
# echo "** BACKUP PATH IS IS $localroot/backup.$localdb.sql.gz **"

# check for existing local backup
if [[ -f $localroot/backup.$localdb.sql.gz ]]; then
  echo "Existing local backup backup.$localdb.sql.gz found. Deleting…"
  rm -rf $localroot/backup.$localdb.sql.gz
fi

# make a backup of the current local database
echo "Backing up local db to backup.$localdb.sql.gz"
wp db export - | gzip > "$localroot/backup.$localdb.sql.gz"

echo "All done, enjoy!"
