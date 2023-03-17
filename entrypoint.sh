#!/bin/sh -l
cat <<- HERE > /tmp/heredoc
{
    "topic": "$2",
    "title": "$3",
    "content": "$4" | base64 -w0)",
    "badge": {
        "text": "$5",
        "color": "$6"
    }
}
HERE

payload=$(cat /tmp/heredoc | jq -c | base64 -w0)
output=$(curl https://api.brakecode.com/api/v1/alert?appId=alerts \
-H 'Content-Type: text/plain' \
-H "x-api-key: { \"apikey\": \"$1\" }" \
-d "$payload")

echo "output: $output"

echo "message-id=${output}" >> $GITHUB_OUTPUT

#$1 - ${{ inputs.api-key }}
#$2 - ${{ inputs.topic }}
#$3 - ${{ inputs.title }}
#$4 - ${{ inputs.content }}
#$5 - ${{ inputs.badge-text }}
#$6 - ${{ inputs.badge-color }}