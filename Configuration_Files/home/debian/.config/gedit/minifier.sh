#!/usr/bin/env sh
file_type() {
    list=$(find "./" -type f -name "*.min.$1" -not -name "all.min.$1")
    > "all.min.$1"
    for i in $list; do
        cat $i >> "all.min.$1"
    done
}
filepath=$GEDIT_CURRENT_DOCUMENT_DIR
cd $filepath
cd ../dist
filename="${GEDIT_CURRENT_DOCUMENT_NAME%.*}"
if [ $1 = "css" ]; then
    cd css
    curl -X POST -s --data-urlencode "input@$filepath/$filename.css" https://www.toptal.com/developers/cssminifier/api/raw > "$filename.min.css"
    file_type "css"
else
    if [ $1 = "scss" ]; then
        cd css
        if [ $filename = "all" ]; then
            sass "$filepath/all.scss" "all.min.css" --style compressed
        else
            sass "$filepath/$filename.scss" "$filename.min.css" --sourcemap=none --style compressed
            file_type "css"
        fi
    else
        if [ $1 = "js" ]; then
            cd js
            curl -X POST -s --data-urlencode "input@$filepath/$filename.js" https://www.toptal.com/developers/javascript-minifier/api/raw > "$filename.min.js"
            file_type "js"
        fi
    fi
fi
