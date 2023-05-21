validate_backup_params(){

    echo " ------------------------------------------------------------- "
    echo "| Welcome in our Backup, please enter the required parameters |"
    echo " ------------------------------------------------------------- "
    read -r -p "Enter the target directory to be backed up: " target_directory
    read -r -p "Enter the backup directory to store the backup: " backup_directory
    read -r -p "Enter the encryption key to encrypt your backup: " encryption_key
    read -r -p "Enter the number of days to backup the changed files during the days: " days
  

    # help message when no parameters 
    while [[ -z $target_directory && -z $backup_directory && -z $encryption_key && -z $days ]] 
    do
     echo " -------------------------------------------------------------------------------------------- "
     echo "| Hello Dear, There are empty parameters. Our Backup should receive from the user 4 inputs.  |" 
     echo "| The first parameter is the target directory to be backed up. The second parameter is the   |"  
     echo "| backup directory to store the backup. The third parameter is an encryption key to encrypt  |"   
     echo "| your backup. The fourth parameter is number of days to backup the changed files during the |" 
     echo "| days.                                                                                      |"
     echo " -------------------------------------------------------------------------------------------- "
     read -r -p "Enter the target directory to be backed up: " target_directory
     read -r -p "Enter the backup directory to store the backup: " backup_directory
     read -r -p "Enter the encryption key to encrypt your backup: " encryption_key
     read -r -p "Enter the number of days to backup the changed files during the days: " days
    done 


    # check target directory validation
    while [[ true ]]   
    do
     if [[ ! -z $target_directory && ! $target_directory =~ ^(/+|(\.|\.\.))$ ]]   
     then
        if [[ -d  $HOME/$target_directory ]]
        then 
          break
        else
		      read -r -p "The target directory doesn't exist in your Home directory, please enter the target directory to be backed up: " target_directory    
        fi
     else
        read -r -p "Invalid target directory, please enter the target directory to be backed up: " target_directory
     fi    
    done

    
    # check backup directory validation
    while [[ true ]]   
    do
     if [[ ! -z $backup_directory && ! $backup_directory =~ ^(/+|(\.|\.\.))$ ]]
     then
        if [[ -d $HOME/$backup_directory ]]
        then 
          break
        else
          mkdir $HOME/$backup_directory
        fi
     else
        read -r -p "Invalid backup directory, please enter the backup directory to store the backup: " backup_directory
     fi    
    done  


    # check encryption key validation
    while [[ true ]]   
    do
     if [[ ! -z $encryption_key ]]
     then
        break
     else
        read -r -p "Invalid encryption key, please enter the encryption key to encrypt your backup: " encryption_key
     fi    
    done  



    # check days validation
    while [[ true ]]   
    do
     if [[ ! -z $days ]]
     then
        if [[ $days != +([0]) && $days == +([0-9]) ]]
        then 
          break
        else
          read -r -p "Days should be integer and not equal 0, please enter another number of days to backup the changed files during the days: " days
        fi
     else
        read -r -p "Invalid num of days, please enter the number of days to backup the changed files during the days: " days
     fi    
    done  

}



backup(){
   
   # create dir in backup dir, dir name is date
   LANG=en_us_88591
   date=`date +"%d %b %Y %H:%M:%S" | sed 's/[:" "]/_/g'`
   mkdir $HOME/$backup_directory/$date
   backup_date_directory=$HOME/$backup_directory/$date
   

   # backup folders and files in target directory
   for item in "$HOME/$target_directory"/*
   do
    if [ -d $item ]
    then
      directory_name=$(basename $item)  
      tar -czf "$backup_date_directory/$directory_name-$date.tgz" -C "$HOME/$target_directory" "$directory_name" 
    elif [ -f $item ]
    then
      file_name=$(basename $item)  
      tar -czf "$backup_date_directory/$file_name-$date.tgz" -C "$HOME/$target_directory" "$file_name"  
    fi
   done


   # encrypt zip files in backup date directoy
   for zip in "$backup_date_directory"/*
   do
     zip_name=$(basename $zip .tgz)
     gpg --batch --yes --passphrase "$encryption_key" --symmetric --output "$backup_date_directory/$zip_name.gpg" "$zip"
     rm $zip
   done

   
} 



validate_restore_params(){

    echo " -------------------------------------------------------------- "
    echo "| Welcome in our Restore, please enter the required parameters |"
    echo " -------------------------------------------------------------- "
    read -r -p "Enter the backup directory which contains the backup: " backup_directory   
    read -r -p "Enter the restore directory to restore the backup in it: " restore_directory
    read -r -p "Enter the decryption key to restore your backup: " decryption_key
  

    # help message when no parameters 
    while [[ -z $backup_directory && -z $restore_directory && -z $decryption_key ]] 
    do
     echo " --------------------------------------------------------------------------------------------- "
     echo "| Hello Dear, There are empty parameters. Our Restore should receive from the user 3 inputs.  |" 
     echo "| The first parameter is the backup directory which contains the backup. The second parameter |"  
     echo "| is the restore directory to restore the backup in it. The third parameter is a decryption   |"   
     echo "| key to to restore your backup.                                                              |" 
     echo " --------------------------------------------------------------------------------------------- "
     read -r -p "Enter the backup directory which contains the backup: " backup_directory   
     read -r -p "Enter the restore directory to restore the backup in it: " restore_directory
     read -r -p "Enter the decryption key to restore your backup: " decryption_key
    done 


    # check backup directory validation
    while [[ true ]]   
    do
     if [[ ! -z $backup_directory && ! $backup_directory  =~ ^(/+|(\.|\.\.))$ ]]
     then
        if [[ -d  $HOME/$backup_directory ]]
        then 
          break
        else
		      read -r -p "The backup directory doesn't exist in your Home directory, please enter the backup directory which contains the backup: " backup_directory    
        fi
     else
        read -r -p "Invalid backup directory, please enter the backup directory which contains the backup: " backup_directory 
     fi    
    done

    
    # check restore directory validation
    while [[ true ]]   
    do
     if [[ ! -z $restore_directory && ! $restore_directory =~ ^(/+|(\.|\.\.))$ ]]
     then
        if [[ -d $HOME/$restore_directory ]]
        then 
          break
        else
          mkdir $HOME/$restore_directory
        fi
     else
        read -r -p "Invalid restore directory, please enter the restore directory to restore the backup in it: " restore_directory
     fi    
    done  


    # check decryption key validation
    while [[ true ]]   
    do
     if [[ ! -z $decryption_key ]]
     then
        break
     else
        read -r -p "Invalid decryption key, please enter the decryption key to restore your backup: " decryption_key
     fi    
    done  
}

restore(){
   
   # create dir in restore dir, dir name is date
   LANG=en_us_88591
   date=`date +"%d %b %Y %H:%M:%S" | sed 's/[:" "]/_/g'`
   mkdir $HOME/$restore_directory/$date
   restore_date_directory=$HOME/$restore_directory/$date
   

   # decrypt files in backup directory
   for encrypted_file in "$HOME/$backup_directory"/*
   do
    if [[ $encrypted_file == *.gpg ]]
    then
      gpg_name=$(basename $encrypted_file .gpg)  
      gpg --batch --yes --passphrase $decryption_key --decrypt --output "$restore_date_directory/$gpg_name.tgz" $encrypted_file >/dev/null 2>&1

      decryption_failed=$?    # decryption faild not equal 0
    fi
   done


   # extract files in restore and delete zip files
   for zip in "$restore_date_directory"/*
   do
    if [[ $zip == *.tgz ]]
    then
      tar -xf "$zip" -C "$restore_date_directory" 
      rm $zip
    fi
   done

   # output message when decryption faild or restore done
   if [ $decryption_failed -ne 0 ]
   then
     echo " ---------------------------------------------------------------- "
     echo "| Decryption failed, Decryption key doesn't match Encryption key |"
     echo " ---------------------------------------------------------------- "
   else
     echo " ----------------------------------- "
     echo "| Restore is successfully completed |"
     echo " ----------------------------------- "
   fi
} 
