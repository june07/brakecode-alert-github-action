#!/bin/sh -l
cat <<- HERE > /tmp/heredoc
{
    "topic": "$2",
    "title": "$3",
    "content": "$(echo $4 | base64 -w0)",
    "badge": {
        "text": "$5",
        "color": "$6"
    }
}
HERE

payload=$(cat /tmp/heredoc | jq -c | base64 -w0)

response=$(curl -s -w ' %{response_code}' https://api.brakecode.com/api/v1/alert?appId=alerts \
-H 'Content-Type: text/plain' \
-H 'x-request-id: github-actions' \
-H "x-api-key: { \"apikey\": \"$1\" }" \
-d "$payload")

if [ -n "$(echo $response | egrep "\s200")" ]; then
    message_id=$(echo $response | sed 's/ 200//' | jq -r '.id')
    echo "message-id=$message_id" >> $GITHUB_OUTPUT
else
    echo $response
    exit 1
fi

#$1 - ${{ inputs.api-key }}
#$2 - ${{ inputs.topic }}
#$3 - ${{ inputs.title }}
#$4 - ${{ inputs.content }}
#$5 - ${{ inputs.badge-text }}
#$6 - ${{ inputs.badge-color }}