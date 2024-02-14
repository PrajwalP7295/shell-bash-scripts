# a shell script where you need to take a file as a input.
# You need to print below thing:
# Last line of file
# (n-1)th line of file
# (n-2)th line of file

#! /bin/bash

FILE=$1
N=$2                            # nth line

tail -n 1 "$FILE"               # last line 
sed -n "$((N-1))p" "$FILE"      # n-1 th line
sed -n "$((N-2))p" "$FILE"      # n-2 th line 


# Output :

# [root@prajwal a3]# ./a3.sh sample.txt 6
# Line 30
# Line 5
# Line 4
# [root@prajwal a3]# ./a3.sh sample.txt 30
# Line 30
# Line 29
# Line 28
# [root@prajwal a3]# ./a3.sh sample.txt 31
# Line 30
# Line 30
# Line 29
# [root@prajwal a3]# ./a3.sh sample.txt 32
# Line 30
# Line 30
# [root@prajwal a3]# ./a3.sh sample.txt 33
# Line 30
