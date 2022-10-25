#!/usr/bin/env sh
filename="${GEDIT_CURRENT_DOCUMENT_NAME%.*}"
if [ $1 = "css" ]; then
    curl -X POST -s --data-urlencode "input@$filename.css" https://www.toptal.com/developers/cssminifier/api/raw > $filename.min.css
else
    if [ $1 = "scss" ]; then
        sass $filename.scss $filename.min.css --style compressed
    else
        if [ $1 = "js" ]; then
            curl -X POST -s --data-urlencode "input@$filename.js" https://www.toptal.com/developers/javascript-minifier/api/raw > $filename.min.js
        fi
    fi
fi
