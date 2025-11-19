#!/bin/bash
# Backup a specified directory to a backup folder with timestamps
# Author: Anveshna
# Date: 18 November 2025

source_dir=$1
backup_dir=$2
timestamp=$(date +%Y%m%d%H%M%S)

if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

cp -r "$source_dir" "$backup_dir/backup_$timestamp"
echo "Backup of $source_dir completed at $backup_dir/backup_$timestamp"
