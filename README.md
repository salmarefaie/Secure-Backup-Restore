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
 
 - We check if user doesn't enter any of the parameter, we display a detailed message to tell him to enter all the parameters and the use of each parameter.
 - then if the user entered all the parameters correctly we should make dir with current date in backup directory.
 - we loop over all files in target directory and compare modified date of each file with current date then we get difference between modified date and current date in seconds and convert it to number of days.
 - we compare  calculated number of days if it is less than or equal calculated number of days with fourth parameter of number of days then we should tar these files and copy them in backup.
 - After that we use gnupg tool to encrypt that tar file with encryted key in the 3rd parameter.
 - then we should create tar archive and append all encrypted tar files through using the tar update switch.
 - Then at the end compress the tar file using gzip.
 - Encrypt the tar.gz file using gnupg tool and delete the tar.gz file
 - We should use crontab to check everyday the modified files and backup them in backup directory by adding a line inside newly created crontab file and remove that file.


 ### restore.sh:
-  User should enter 3 parameters ; the first parameter is the directory that contains the backup, the second parameter is the directory that the backup should be restored to, and the third parameter is the decryption key that should be used to restore the backup.

- We should Create a temp directory under the restore directory.
- We should Loop over all the files in the backup directory.
- We use gnupg tool to decrypt the files one by one using decryption key same as encryption keyand store the resulting file under the temp directory.
- We loop over the files stored in the temp directory and extract them one by one under the restore directory.


 ### how to run project:
 - At first, Download gnup tool if it doesn't exist
 ```bash
    sudo apt install gnupg
 ```
 - 
 - Then, clone the project
  ```bash
     https://github.com/salmarefaie/Secure-Backup-Restore.git
  ``` 
 - Add downloaded folder in ~/.bashrc by vi
  ```bash
     export PATH=$PATH:$HOME/DevOps/Secure-Backup-Restore
  ``` 
 - excute all scripts
 ```bash
    chmod +x backup.sh
    chmod +x restore.sh
  ``` 
 - To run the backup
   ```bash
     . ./backup.sh
   ``` 
 - To run the restore
   ```bash
    . ./restore.sh
   ``` 




