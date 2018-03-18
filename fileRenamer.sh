#!/bin/bash -x

directoryPath="$1"

cd $directoryPath

for file in *;
  do mv "$file" "$(echo $file | sed -e 's/-[[:alnum:]]*_[[:alnum:]]*_[[:alnum:]]*\././g' -e 's/_/ /g')";
  # do mv "$file" "$(echo $file | sed 's/-\w+.mp3//p')";
  #  | sed 's/_/ /g'
  # echo "Renamed $file to something new"

done
