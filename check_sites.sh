#!/bin/bash

declare -a SITES=("https://google.com" "https://facebook.com" "https://twitter.com")
LOGFILE="website_status.log"

> $LOGFILE  # Очистка файлу логів

for SITE in "${SITES[@]}"; do
    if curl -s --head --fail $SITE; then
        echo "$SITE is UP" >> $LOGFILE
    else
        echo "$SITE is DOWN" >> $LOGFILE
    fi
done

echo "Results have been saved to $LOGFILE"
