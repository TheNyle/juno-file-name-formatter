#!/bin/bash

downloadsDirectory="/Users/$USER/Downloads"
destinationDirectory="/Users/$USER/Dropbox/Music"
zipFilePattern="juno_download_*.zip"
outputDirectory="juno_downloads_formatted"
zipFiles=($zipFilePattern) # This will match multiple zip files - Figure out how to just match the first

# Loop through all files and format the names
rename_files () {
  for file in *;
    do 
      echo "Renaming $file"
      mv "$file" "$(echo $file | sed -e 's/-[[:alnum:]]*_[[:alnum:]]*_[[:alnum:]]*\././g' -e 's/_/ /g')";
    done
}

# Loop through sub-directories and format the names
rename_folders () {
  for folder in *;
    do 
      echo "Renaming sub-directory $folder"
      cd $folder
      rename_files 
      cd ../
      mv "$folder" "$(echo $folder | sed -e 's/_/ /g')";
    done
}

# Change to the Downloads directory
cd $downloadsDirectory

# Unzip file folder into the $outputDirectory
unzip $zipFiles -d $outputDirectory

# Change directory to $outputDirectory
cd $outputDirectory

# Count the number of sub-directories in the $outputDirectory
subdircount=`find $PWD -maxdepth 1 -type d | wc -l`

# Check if the $outputDirectory contains sub-directories
if [ $subdircount -gt 1 ];
  then 
    echo "This directory contains sub-directories"
    rename_folders
  else 
    echo "This directory does not contain any sub-directories"
    rename_files
fi