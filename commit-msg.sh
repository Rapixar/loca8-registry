#!/bin/bash
MSG_FILE=$1
FILE_CONTENT="$(cat $MSG_FILE)"
# Initialize constants here
#export REGEX='^(DE[0-9]+:|US[0-9]+|Merge) .+'
export REGEX='.*(feature).*' #Checks for a message in the commit message (feature)
#export ERROR_MSG="Commit message format must match regex \"${REGEX}\""
export ERROR_MSG="Commit message does not meet requirements"
if [[ $FILE_CONTENT =~ $REGEX ]]; then
 echo "Good commit!"
else
  echo "Wrong commit message \"$FILE_CONTENT\""
 echo $ERROR_MSG
 exit 1
fi
exit 0