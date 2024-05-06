#!/bin/bash

# Initial clone
if [ ! -d ".git" ]; then
    git clone $GIT_REPO .
fi

# Polling loop
while true; do
    git fetch origin
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u})

    if [ $LOCAL != $REMOTE ]; then
        echo "Changes detected. Pulling updates..."
        git pull
        npm install
        npm run build
        # Ensure the output directory matches the one served by Nginx
        cp -r dist/* /usr/share/nginx/html/
    fi
    sleep 60 # Poll every minute
done
