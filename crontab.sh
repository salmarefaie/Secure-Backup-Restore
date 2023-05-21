#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob
 
 
   # backup modified only 
    for item in "$HOME/$target_directory"/*
    do
       modification_time=$(stat -c %Y "$item")
       echo $modification_time
       counter = 0
       if mod > date 
          mkdir date
          tar 
          counter ++
       
      #  echo `date -d "${date//_/ }" "+%s"`
    done