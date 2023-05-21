#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

source ./backup_restore_lib.sh
validate_restore_params
restore



# date1="2023-05-20"
# date2="2023-06-01"

# date -d "$date1" +%s
# if [ $(date -d "$date1" +%s) -lt $(date -d "$date2" +%s) ]; then
#   echo "$date1 is less than $date2"
# elif [ $(date -d "$date1" +%s) -gt $(date -d "$date2" +%s) ]; then
#   echo "$date1 is greater than $date2"
# else
#   echo "$date1 is equal to $date2"
# fi

# #!/bin/bash

# # Define the new cron schedule
# new_cron_schedule="* * * * * timeout 10m echo 'hii task' >> /home/salma/DevOps/Secure-Backup-Restore/filee.txt" 


# # Write the new cron schedule to a temporary file
# echo "$new_cron_schedule" > /tmp/neww_crontab

# # Load the temporary crontab file
# crontab /tmp/neww_crontab



# # Clean up the temporary file
# # rm /tmp/new_crontab




# # Get the PID (Process ID) of the cron job
# cron_pid=$(pgrep cron)

# # Kill the cron job using the PID
# kill $cron_pid
# chmod +x kill_cron.sh
# echo "/path/to/kill_cron.sh" | at now + 5 minutes



# #!/bin/bash

# # Start time
# start_time=$(date +%s)

# # Duration in seconds (e.g., 5 minutes = 300 seconds)
# duration=300

# # Your script commands here
# # ...

# # Check if the elapsed time has exceeded the desired duration
# current_time=$(date +%s)
# elapsed_time=$((current_time - start_time))

# if [ "$elapsed_time" -ge "$duration" ]; then
#     # Stop or exit the script
#     exit 0
# fi

# # Remaining commands or cleanup tasks if the duration has not been reached
# # ...




# # Define the new cron schedule
# new_cron_schedule= "*/5 * * * * /path/to/your/script.sh"

# # Write the new cron schedule to a temporary file
# echo "$new_cron_schedule" > /tmp/new_crontab

# # Load the temporary crontab file
# crontab /tmp/new_crontab

# # Clean up the temporary file
# rm /tmp/new_crontab











# #!/bin/bash

# /path/to/command arg1 arg2 && echo "Job done" | at now + 12 days

# # #!/bin/bash

# # # Add the cron job to the crontab
# # (crontab -l 2>/dev/null; echo "* * * * * /path/to/script.sh") | crontab -

# # # Schedule the removal of the cron job after 12 days
# # echo "/usr/bin/at -f /path/to/remove_cron.sh now + 12 days" | at now

# # * * * * * export RUN_CRON_JOB=true && /path/to/script.sh


# # if [[ "$RUN_CRON_JOB" == "true" ]]; then
# #     # Place the code to be executed by cron here
# #     echo "Executing cron job..."
# #     # Add your specific commands or script code
# # else
# #     # Place the code to be executed outside cron here
# #     echo "Executing non-cron code..."
# #     # Add your specific commands or script code
# # fi