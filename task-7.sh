# Write a script which takes string/paragraph or a file containing the string/paragraph as input and convert the same into the format as per below rules.
# i) The start/first letter of the file or the Input should be lower case.
# ii) Next letters should be  Upper, Lower, Upper, Lower & so on.
# iii) Every next words first letter should be the same as the last letter of the previous word.

# Input: "This is the input file or string or paragraph to the script"
# Output: tHiS Is tHe iNpUt fIlE Or sTrInG Or pArAgRaPh tO ThE ScRiPt


#! /bin/bash

input=$1

if [[ -f "$input" ]]; then
    ipstr=$(cat "$input")
else
    ipstr="$input"
fi

opstr=""

for (( i=0; i<${#ipstr}; i++ )); do
    if ((i%2 == 0)); then
        opstr+=$(echo "${ipstr:$i:1}" | tr '[:upper:]' '[:lower:]')
    else
        opstr+=$(echo "${ipstr:$i:1}" | tr '[:lower:]' '[:upper:]')
    fi
done

echo "Output : $opstr"


# Output : 
# ./a7.sh a7.txt
# Output : tHiS Is tHe iNpUt fIlE Or sTrInG Or pArAgRaPh tO ThE ScRiPt
