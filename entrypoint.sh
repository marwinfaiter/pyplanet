#!/bin/bash

pip install pyplanet --upgrade

IFS=';' read -ra APPS_ARRAY <<< "$APPS"
for app_string in "${APPS_ARRAY[@]}"
do
    IFS='|' read -ra URL_APPS_ARRAY <<< "$app_string"

    URL=${URL_APPS_ARRAY[1]}

    IFS=',' read -ra APPS_ARRAY <<< "${URL_APPS_ARRAY[0]}"
    for app in "${APPS_ARRAY[@]}"
    do
        if [[ ! -z "$URL" ]]
        then
            echo COMMAND python -m pip install -i "$URL" "$app"
            python -m pip install -i "$URL" "$app"
        else
            echo COMMAND: python -m pip install "$app"
            python -m pip install "$app"
        fi

    done

done

exec server/manage.py start
