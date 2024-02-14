# Gen. a random val. csv file within two indexes provided 



#! /bin/bash

index1=$1
index2=$2

if [ $index2 -lt $index1 ]
 then
  echo "Error: index2 must be greater than or equal to index1."
  exit
fi

file="inputFile.csv"
rm -f "$file"

for ((i=$index1; i<=$index2; i++))
 do
  randomNo=$((RANDOM%100))
  echo "$i, $randomNo" >> "$file"
done


# Output : ./a6.sh 2 8

# [prajwal@prajwal a6]$ ls
# a6.sh  inputFile.csv
# [prajwal@prajwal a6]$ cat inputFile.csv
# 2, 5
# 3, 1
# 4, 19
# 5, 61
# 6, 67
# 7, 52
# 8, 11
