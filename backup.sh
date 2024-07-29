#!/bin/bash
# https://brian.windheim.org/2012/time-machine-sucks-use-rsync-instead
# rsync semantics with slash: https://stackoverflow.com/a/31278462 
# Basically only slash at the end of src has a major effect. For the destination, it makes a difference
# only when the (1) src is a file (2) dst is non-existent
# rsync delete related: https://superuser.com/a/1513723
# --del is alis for --delete-during, which deletes non-existent files as rsync encounters them
echo "Backing up $HOME..."
rsync -ah --stats --info=progress2 --del --exclude ".DS_Store" --exclude ".fseventsd" --exclude ".Spotlight-V100" --exclude ".TemporaryItems"  "$HOME" "/Volumes/lin-apfs/mbp-2019-backup/home/"
echo "Backing up /Applications"
rsync -ah --stats --info=progress2 --del --exclude ".DS_Store" --exclude ".fseventsd" --exclude ".Spotlight-V100" --exclude ".TemporaryItems"  "/Applications" "/Volumes/lin-apfs/mbp-2019-backup/apps/"

# rsync -ah --stats --info=progress2 --del --exclude ".DS_Store" --exclude ".fseventsd" --exclude ".Spotlight-V100" --exclude ".TemporaryItems"  "$HOME/Desktop/Hi/tmp" "/Volumes/lin-apfs/mbp-2019-backup/"
