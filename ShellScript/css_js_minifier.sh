#!/usr/bin/env sh
filename="${GEDIT_CURRENT_DOCUMENT_NAME%.*}"
if [ $1 = "css" ]; then
    if [ $filename = "all" ]; then
        css_files=$(find . -type f -name "*.css" -not -name "*.min.css")
        for i in $css_files; do
            cat $i >> /tmp/all.css
        done
        curl -X POST -s --data-urlencode 'input@/tmp/all.css' https://www.toptal.com/developers/cssminifier/api/raw > all.min.css
        rm /tmp/all.css
    else
        curl -X POST -s --data-urlencode "input@$filename.css" https://www.toptal.com/developers/cssminifier/api/raw > $filename.min.css
    fi
else
    if [ $1 = "scss" ]; then
        BASEDIR=$(dirname "$0")
        theme="${BASEDIR%/shellscript*}/packages/theme"
        if echo "$GEDIT_CURRENT_DOCUMENT_DIR" | grep -q "$theme/src/scss"; then
            if [ -e "$theme/dist/style.min.css.map" ]; then
                rm "$theme/dist/style.min.css.map"
            fi
            sass $filename.scss "$theme/dist/style.min.css" --style compressed
        else
            sass $filename.scss $filename.min.css --style compressed
        fi
    else
        if [ $1 = "js" ]; then
            if [ $filename = "all" ]; then
                js_files=$(find . -type f -name "*.js" -not -name "*.min.js")
                for i in $js_files; do
                    cat $i >> /tmp/all.js
                done
                curl -X POST -s --data-urlencode 'input@/tmp/all.js' https://www.toptal.com/developers/javascript-minifier/api/raw > all.min.js
                rm /tmp/all.js
            else
                curl -X POST -s --data-urlencode "input@$filename.js" https://www.toptal.com/developers/javascript-minifier/api/raw > $filename.min.js
            fi
        fi
    fi
fi
