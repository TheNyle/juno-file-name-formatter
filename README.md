# Juno Download File Name Formatter

This is a Shell script to automatically rename mp3 files downloaded from Juno Downloads on Mac OSX.

### What does this script do?

This script will go to the `~/Downloads` directory (the default download location) and search for a `.zip` file that matches the `juno_download*.zip` pattern. This is then un-zipped, and each file within it is renamed in the following manner:

```
1-Artist_Name_-_Song_Title-320kb_s_MP3.mp3
```

to:
```
1-Artist Name - Song Title.mp3
```
If the download package contains sub-directories, these will also be automatically renamed.

### Running the script:

1. Download music from [Juno Download](https://www.junodownload.com/) and leave the `.zip` file in the default `Downloads` folder.

1. Navigate to the directory this shell script has been cloned to

1. Modify the permissions on the script using `chmod +x JunoFileFormatter.sh`

1. Run the script with `./JunoFileFormatter.sh`


### To Do List:

- [X] Pass the script the .zip folder and automate unpacking
- [ ] Automatically handle downloads with and without sub-directories
- [ ] Organise music into sub-folders based on album
- [ ] Pass optional parameter of destination folder
- [ ] Handle ampersands and special characters in names