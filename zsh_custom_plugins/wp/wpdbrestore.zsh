#!/bin/zsh

#variables
localroot=$(wp cli info --format=json | jq '[.["project_config_path"]|rtrimstr("/wp-cli.local.yml")]' | tr -d "[:space:][\"]")
localdb=$(wp eval 'echo DB_NAME;')

# echo "** LOCAL ROOT IS $localroot **"
# echo "** BACKUP PATH IS IS $localroot/backup.$localdb.sql.gz **"

# check for existing local backup
if [[ -f $localroot/backup.$localdb.sql.gz ]]; then
  echo "Restoring db from backup.$localdb.sql.gz"
  wp db reset --yes
  gzcat $localroot/backup.$localdb.sql.gz | wp db import -

  echo "All done, enjoy!"

else
  # No existing backup
  echo "Backup file backup.$localdb.sql.gz not found!"

fi
