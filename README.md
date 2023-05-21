# Secure-Backup-Restore

## Overview
There are two bash scripts that perform secure encrypted backup and restore functionality. The backup script should backup the directories and files within the target directory, each directory and file in a separate compressed tar file. Then, the gnupg tool should be used to encrypt the tar files in backup directory. After the backup is done, it
should be copied to a remote server. The restore script should work in a reverse way of backup script and restore a backup.


## Requirements
- The system should have the Bash interpreter installed. 
- Make sure that the gnupg tool is installed to encrypt and decrypt the files.

 
## Functionality
 ### Backup.sh:
 - User should enter 4 parameters for validate_backup_params function. The first parameter is the directory to be backed up, the second parameter is the directory which should store the backup, the third parameter is an encryption key that you should use to encrypt your backup and the fourth parameter is number of days to backup only the changed files during the days.











