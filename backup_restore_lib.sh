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
     if [[ ! -z $target_directory ]]
     then
        if [[ -d  $HOME/$target_directory ]]
        then 
          break
        else
		  read -r -p "The target directory doesn't exist in your pc, please enter the target directory to be backed up: " target_directory    
        fi
     else
        read -r -p "Invalid target directory, please enter the target directory to be backed up: " target_directory
     fi    
    done

    
    # check backup directory validation
    while [[ true ]]   
    do
     if [[ ! -z $backup_directory ]]
     then
        if [[ -d $HOME/$backup_directory ]]
        then 
          break
        else
          read -r -p "The backup directory doesn't exist in your pc. please enter the backup directory to store the backup: " backup_directory
        fi
     else
        read -r -p "Invalid backup directory, please enter the backup directory to store the backup: " backup_directory
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
   date=`date +"%d %b %Y %H:%M:%S" | sed 's/[:" "]/_/g'`
   mkdir $HOME/$backup_directory/$date
   
}