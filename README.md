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

1. Download music from [Juno Download](https://www.junodownload.com/) and leave the `.zip` file in the default `Downloads` folder.

1. Navigate to the directory this shell script has been cloned to

1. Modify the permissions on the script using `chmod +x JunoFileFormatter.sh`

1. Run the script with `./JunoFileFormatter.sh`


### To Do List:

- [ ] Organise music into sub-folders based on album
- [X] Pass the script the .zip folder and automate unpacking
- [ ] Pass optional parameter of destination folder