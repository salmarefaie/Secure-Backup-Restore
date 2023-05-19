#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------------------------------------------------------- "
echo " Welcome in our Backup, please enter the required parameters"
echo " ----------------------------------------------------------- "
read -p "Enter the target directory: " target_directory
read -p "Enter the backup directory: " backup_directory
read -p "Enter the encryption key to encrypt your backup: " encryption_key
read -p "Enter the number of days to backup the changed files during the days: " days


# help message when no parameters 
while [[ -z $target_directory && -z $backup_directory && -z $encryption_key && -z $days ]] 
do
  echo " ----------------------------------------------------------- "
   echo "Hello Dear, There are empty parameters. Our Backup should receive from the user
4 input command-line parameters; the first parameter is the directory to be backed up, the second
parameter is the directory which should store eventually the backup, and the third parameter is an
encryption key that you should use to encrypt your backup and the fourth parameter is number of
days (n) that the script should use to backup only the changed files during the last n days."
echo " ----------------------------------------------------------- "
   read -p "Enter the target directory: " target_directory
   read -p "Enter the backup directory: " backup_directory
   read -p "Enter the encryption key to encrypt your backup: " encryption_key
   read -p "Enter the number of days to backup the changed files during the days: " days
done 


# target directory
while [[ true ]]   
do
   if [[ ! -z $target_directory ]]
   then
     exist_target=`find $HOME -type d -name "$target_directory"`
     if [[ $exist_target == "$HOME/$target_directory" ]]
     then 
       break
     else
         echo " ----------------------------------------------------------- "

       echo "target directory not found"
         echo " ----------------------------------------------------------- "
       read -p "Enter the target directory: " target_directory
     fi
   else
            echo " ----------------------------------------------------------- "
     echo "target directory empty"
              echo " ----------------------------------------------------------- "
     read -p "Enter the target directory: " target_directory
   fi    
done


# backup directory
while [[ true ]]   
do
   if [[ ! -z $backup_directory ]]
   then
     exist_backup=`find $HOME -type d -name "$backup_directory"`
     if [[ $exist_backup == "$HOME/$backup_directory" ]]
     then 
       break
     else
              echo " ----------------------------------------------------------- "

       echo "backup directory not found"
                echo " ----------------------------------------------------------- "

       read -p "Enter the backup directory: " backup_directory
     fi
   else
            echo " ----------------------------------------------------------- "

     echo "backup directory empty"
              echo " ----------------------------------------------------------- "

     read -p "Enter the backup directory: " backup_directory
   fi    
done  

# date +"%d-%m-%Y %H:%M:%S"