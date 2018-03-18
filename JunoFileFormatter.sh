#!/bin/bash

downloadsDirectory="/Users/$USER/Downloads"
zipFilePattern="juno_download_*.zip"
outputFolder="juno_downloads_formatted"
zipFiles=($zipFilePattern) # This will match multiple zip files - Figure out how to just match the first

# Change to the Downloads directory
cd $downloadsDirectory

# Unzip file folder into the $outputFolder
unzip $zipFiles -d $outputFolder

# Change directory to $outputFolder
cd $outputFolder

# Loop through all files and format the names
for file in *;
  do mv "$file" "$(echo $file | sed -e 's/-[[:alnum:]]*_[[:alnum:]]*_[[:alnum:]]*\././g' -e 's/_/ /g')";
  done
