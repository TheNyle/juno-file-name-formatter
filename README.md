# Juno Download File Name Formatter

This is a Shell script to automatically rename mp3 files downloaded from Juno Downloads on Mac OSX.

### What does this script do?

Run this Bash script with the location of the downloaded folder full of music as a paramter and it will change the format from:

```
1-Artist_Name_-_Song_Title-320kb_s_MP3.mp3
```

to:
```
1 Artist Name - Song Title.mp3
```


### Running the script:

1. Download music from [Juno Download](https://www.junodownload.com/)

1. Unzip the folder containing all of the `.mp3` files

1. [Option]-[right-click] the directory and [click] `Copy x as Pathname`

1. Navigate to the directory this shell script is stored in 

1. Modify the permissions on the script using `chmod +x fileRenamer.sh`

1. Run the script with `./fileRenamer.sh [Paste folder pathname]`


### To Do List:

- [ ] Organise music into sub-folders based on album
- [ ] Pass the script the .zip folder and automate unpacking
- [ ] Pass optional second parameter of destination folder