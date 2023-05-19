#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

source ./backup_restore_lib.sh
validate_backup_params
backup