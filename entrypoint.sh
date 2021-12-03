#!/bin/bash

# Startup Xvfb
Xvfb -ac :99 -screen 0 1280x1024x16 > /dev/null 2>&1 &

# Export some variables
export DISPLAY=:99.0
export PUPPETEER_EXEC_PATH="google-chrome-stable"

bash --version

# Run commands
for task in "$@"; do {
    echo "Running '$task'!"
    if [ "${task: -1}" = "&" ]; then
        newtask=${task::-1}
        $newtask &
    else
        $task
    fi
    
} done
