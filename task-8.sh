# Write a script which takes string/paragraph or a file containing the string/paragraph as input and convert the same as per below rules.
# i. 1st letter in queue should be Capital & every alternate/next letter should be in diff case.
# ii. The 1st rule does not apply to "i,t,p" so skip them from conversion/count & keep them as it is in Input
# iii. Treat the next letter to these  "i,t,p"  letters as next in queue for the case conversion

# Ex:
# Input: thIs is the InpuT To the Program
# Output: tHIs iS thE InpUT To tHe PRoGrAm

# Input: another sImilar Input to The program
# Output: AnOthEr SImiLaR InpUt to THe pRoGrAm


#!/bin/bash

read -p "Input : " input
output=""
length=${#input}
j=1

for ((i=0; i<length; i++)); do
  if [[ "${input:i:1}" =~ [itpITP[:space:]] ]]; then
    output="$output${input:i:1}"
  else
    value=$(printf "%d" "'${input:i:1}")
    if [ "$j" -eq 1 ]; then
      if ((value>96 && value<122)); then
        value=$((value-32))
      fi
      output="$output$(printf "\\$(printf '%03o' "$value")")"
      j=0
    else
      if ((value>64 && value<91)); then
        value=$((value+32))
      fi
      output="$output$(printf "\\$(printf '%03o' "$value")")"
      j=1
    fi
  fi
done

echo "Output : $output"



# Output : 

# It will prompt for input - 

# ./a8.sh
# Input :

# After you give the input string - 

# ./a8.sh
# Input : thIs is the InpuT To the Program
# Output : tHIs iS thE InpUT To tHe PRoGrAm



