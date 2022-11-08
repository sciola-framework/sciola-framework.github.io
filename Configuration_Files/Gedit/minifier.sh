#!/usr/bin/env sh
file_type() {
    list=$(find "$BASEDIR/dist/$1" -type f -name "*.min.$1" -not -name "all.min.$1")
    > "$BASEDIR/dist/$1/all.min.$1"
    for i in $list; do
        cat $i >> "$BASEDIR/dist/$1/all.min.$1"
    done
}
BASEDIR=$(dirname "$0")
filename="${GEDIT_CURRENT_DOCUMENT_NAME%.*}"
if [ $1 = "css" ]; then
    curl -X POST -s --data-urlencode "input@$filename.css" https://www.toptal.com/developers/cssminifier/api/raw > "$BASEDIR/dist/css/$filename.min.css"
    file_type "css"
else
    if [ $1 = "scss" ]; then
        if [ $filename = "all" ]; then
            sass all.scss "$BASEDIR/dist/css/all.min.css" --style compressed
        else
            sass $filename.scss "$BASEDIR/dist/css/$filename.min.css" --sourcemap=none --style compressed
            file_type "css"
        fi
    else
        if [ $1 = "js" ]; then
            curl -X POST -s --data-urlencode "input@$filename.js" https://www.toptal.com/developers/javascript-minifier/api/raw > "$BASEDIR/dist/js/$filename.min.js"
            file_type "js"
        fi
    fi
fi
