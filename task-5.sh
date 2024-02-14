# Using the attached json file, write a shell script that takes 3 parameters from the user:

# A number that represents how long the file should stay in the bucket, after which it is deleted. Let’s call this the number of “retention_days”
# A prefix string for object name
# Path to json file(image.json attached in this email)
# Given the above inputs, your script should find the total number of images that are:

# older than the given retention_days (i.e. due for deletion)
# Match the given prefix_string

# Script Output could be like:
# Total number of images older than 90 days 352
# Total number of images with prefix ccops older than 90 days : 71




retention_days=$1
prefix_str=$2
file=$3

current_date=$(date +%s)
exp_img_count=0
pref_img_count=0

for i in $(jq -r '.[] | @base64' "$file"); do
	decode_item=$(echo "$i" | base64 --decode)
	create_date=$(echo "$decode_item" | jq -r '.creationTimestamp')
	create_sec=$(date -d "$create_date" +%s)
	diff_sec=$((current_date - create_sec))
	diff_days=$((diff_sec/86400))

	if(($diff_days >= $retention_days)); then
		exp_img_count=$((exp_img_count+1))
	fi

	name=$(echo "$decode_item" | jq -r '.name')
	if [[ "$name" == "$prefix_str"* ]]; then
		date_create=$(echo "$decode_item" | jq -r '.creationTimestamp')
		sec_create=$(date -d "$date_create" +%s)
		sec_diff=$((current_date - sec_create))
		day_diff=$((sec_diff/86400))
		if(($day_diff >= $retention_days)); then
			pref_img_count=$((pref_img_count+1))
		fi
	fi
done

echo "Total number of images older than $retention_days : $exp_img_count"
echo "Total number of images with prefix $prefix_str older than $retention_days : $pref_img_count"
