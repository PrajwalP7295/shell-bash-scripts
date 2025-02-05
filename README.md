# SHELL SCRIPTS

This repository contains a collection of useful shell scripts designed for various system administration, automation, and troubleshooting tasks.

## [TASK-1](task-1.sh) : System Resource Monitoring Script

This shell script provides a quick overview of the key system resources of a Linux server, including __MEMORY__, __SWAP__, __DISK USAGE__, and __PROCESS__ consumption.

- USAGE :-

    - Create the script file : 
    ``` 
    nano resource_util.sh
    ```
    - Provide executable permissions for the script :
    ```
    chmod +x resource_util.sh
    ```
    - Execute the script :
    ```
    ./resource_util.sh
    ```

## [TASK-2](task-2.sh) : Find Files Script

This script allows users to recursively search for files based on a specified pattern (e.g., __*.log, *.txt__) within a given directory. 

It prompts the user to enter the directory, file name pattern, and a string to filter the files. The script then sorts the matching files by their last modified time and filters them based on the provided string. The filtered results are displayed on the command line, sorted list of files is stored in a file and any errors encountered during execution are logged in an error file.

- USAGE :-

    - Create the script file : 
    ``` 
    nano find_files.sh
    ```
    - Provide executable permissions for the script :
    ```
    chmod +x find_files.sh
    ```
    - Execute the script :
    ```
    ./find_files.sh
    ```
    - Enter the required fields.

- EXAMPLE :-

```
ubuntu $ ./find_files.sh 
Enter the directory to search in (e.g., /home/user or /): /
Enter the file pattern to search for (e.g., *.log, *.txt): .log
Enter the string to filter the files: error

Searching for files matching '*.log' in '/'...

Sorted files saved to 'sorted-files.txt'.

Filtered files containing 'error':
/opt/extension/node_modules/is-arrayish/yarn-error.log
/opt/extension/node_modules/is-arrayish/yarn-error.log
```

## [TASK-3](task-3.sh) : 