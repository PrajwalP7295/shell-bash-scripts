# Write bash scripts which gives multiple options for case conversion patterns


#!/bin/bash

echo "Enter a string or paragraph:"
read input_string

echo "Select an option:"
echo "1. Convert to uppercase"
echo "2. Convert to lowercase"
echo "3. Convert as per task 1"
echo "4. Convert as per task 2"

read option

case $option in
    1)
        converted_string=$(echo "$input_string" | tr '[:lower:]' '[:upper:]')
        echo "Uppercase string: $converted_string"
        ;;
    2)
        converted_string=$(echo "$input_string" | tr '[:upper:]' '[:lower:]')
        echo "Lowercase string: $converted_string"
        ;;
    3)
	./a7case.sh "$input_string"
        ;;
    4)
	./a8newCase.sh "$input_string"
        ;;
    *)
        echo "Invalid option selected. Please select a valid option."
        ;;
esac



# Output: 

# ./a9.sh
# Enter a string or paragraph:                # the cli will prompt here for input string 
# AnOthEr SImiLaR InpUt to THe pRoGrAm
# Select an option:
# 1. Convert to uppercase
# 2. Convert to lowercase
# 3. Convert as per task 1
# 4. Convert as per task 2
# 2
# Lowercase string: another similar input to the program