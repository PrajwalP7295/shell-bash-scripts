# a shell script which will send an DSR email with a file attachment (screenshots or logs) everyday EOD at 6:30PM excluding weekends. 



#! /bin/bash

to="recipient-mail-id"
subject="DSR for $(date +%d-%m-%Y)"

body="Hello,\n\n Here is the DSR for $(date +%d-%m-%Y).\n\nRegards,\nPrajwal."

file="/absolute-path-of-file"

echo -e "$body" | mailx -s "$subject" -A "$file" "$to"

