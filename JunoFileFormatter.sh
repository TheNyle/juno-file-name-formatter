#!/bin/bash

# Setup constants
downloadsDirectory="/Users/$USER/Downloads"
tempOutputDirectory="juno_downloads_formatted_temp"
destinationDirectory="/Users/$USER/Dropbox/Music"
zipFilePattern="juno_download_*.zip"
zipFiles=($zipFilePattern) # This will match multiple zip files - Figure out how to just match the first

# Loop through all files and format the names
file_handler () {
  for file in *;
    do 
      echo "Renaming $file"
      mv "$file" "$(echo $file | sed -e 's/-[[:alnum:]]*_[[:alnum:]]*_[[:alnum:]]*\././g' -e 's/_/ /g')";
    done
}

# Loop through sub-directories and format the names
sub_directories_handler () {
  for subDirectory in *;
    do 
      cd $subDirectory
      file_handler 
      cd ../
      echo "Renaming sub-directory $subDirectory"
      mv "$subDirectory" "$(echo $subDirectory | sed -e 's/_/ /g')";
    done
}

# Open formatted file in the following applications
open_formatted_files_in_apps () {
  for formattedFile in *;
    do 
      echo "Opening $formattedFile in iTunes"
      open -a "iTunes" "$formattedFile"
    done
}

# Loop through formatted sub-directories and move them to destination
move_formatted_sub_directories_to_output_directory () {
  for formattedSubDirectory in *;
    do 
      echo "Moving $formattedSubDirectory to $destinationDirectory"
      mv -v "$formattedSubDirectory" $destinationDirectory
      cd $destinationDirectory/"$formattedSubDirectory"
      open_formatted_files_in_apps
    done
}

# Clean up generated files
clean_up () {
  rm -r $tempOutputDirectory
  rm $zipFiles
}

# Begin process

# Change to the Downloads directory
cd $downloadsDirectory

# Unzip file folder into the $tempOutputDirectory
unzip $zipFiles -d $tempOutputDirectory

# Change directory to $tempOutputDirectory
cd $tempOutputDirectory

# Count the number of sub-directories in the $tempOutputDirectory
subDirectoryCount=`find $PWD -maxdepth 1 -type d | wc -l`

# Check if the $tempOutputDirectory contains sub-directories
if [ $subDirectoryCount -gt 1 ];
  then 
    echo "This directory contains sub-directories"
    sub_directories_handler
    move_formatted_sub_directories_to_output_directory
    clean_up
  else 
    echo "This directory does not contain any sub-directories"
    file_handler
fi