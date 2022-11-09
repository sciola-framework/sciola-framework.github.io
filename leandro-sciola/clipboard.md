# Clipboard

### Video download
---

```php
<?php

function download($title, $url, $format, $extension) {
    switch ($extension) {
      case 'm4a':
        $type = 'audio/m4a';
        break;
      case 'm4v':
        $type = 'video/mp4';
        break;
      case 'mp4':
        $type = 'video/mp4';
        break;
      case 'webm':
        $type = 'video/webm';
        break;
      case 'flv':
        $type = 'video/x-flv';
        break;
      case 'mov':
        $type = 'video/quicktime';
        break;
      case 'oga':
        $type = 'audio/ogg';
        break;
      case 'ogv':
        $type = 'video/ogg';
        break;
      case 'ogg':
        $type = 'application/ogg';
        break;
      case 'avi':
        $type = 'video/x-msvideo';
        break;
      case 'wav':
        $type = 'audio/x-wav';
        break;
      default:
        $type = 'video/mpeg';
    }
    header('Pragma: public');
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Cache-Control: public');
    header('Content-Description: File Transfer');
    header("Content-type: $type");
    header('Content-Disposition: attachment; filename="' .
    rawurlencode($title) . '.' . $extension . '"');
    echo readFile("https://foo.demo/download?url=$url&format=$format");
    exit;
}

?>
```

### OEmbed
---

https://noembed.com

https://github.com/leedo/noembed

https://github.com/ricardofiorani/oembed - OEmbed is a PHP library to assist you retrieving data from providers that supports OEmbed.
It was built to be a successor of ricardofiorani/php-video-url-parser

```php
<?php

function embed($url) {
    header('Content-Type: application/json; charset=utf-8');
    return file_get_contents("https://noembed.com/embed?url=$url");
}

echo embed('http://www.youtube.com/watch%3Fv%3DbDOYN-6gdRE'); // Print video data in JSON format.

?>
```

### GIT
---

leandro@sciola:~$ **git clone https://github.com/sciola-framework/sciola-framework.github.io**

leandro@sciola:~$ **git remote set-url origin https://<token>@github.com/sciola-framework/sciola-framework.github.io**

********************************************************************************

leandro@sciola:~$ **git tag -d v1.1.2**

leandro@sciola:~$ **git push --delete origin v1.1.2**

leandro@sciola:~$ **GIT_COMMITTER_DATE="2021-08-10 12:00"**

leandro@sciola:~$ **git tag -a v1.1.2 -m "v1.1.2"**

leandro@sciola:~$ **git push --tags origin main**

********************************************************************************

leandro@sciola:~$ **git status**

leandro@sciola:~$ **git add .**

leandro@sciola:~$ **git commit -m "Description..."**

leandro@sciola:~$ **git push origin main**

---

### JS - Promise

[DEMO - PROMISE](https://jsfiddle.net/dgvk612x/)

```html
<script>
function fnc(arg) {
    return new Promise(function (resolve, reject) {
        if (arg) {
            resolve(arg);
        } else {
            reject("Error");
        }
    });
}
async function demo(arg, cb) {
    return cb(await fnc(arg));
}
demo("abc", data => console.log(data));
</script>
```

---

### Compile .SCSS files

leandro@sciola:~$ **sass import.scss all.css**

leandro@sciola:~$ **sass import.scss all.min.css --style compressed**

leandro@sciola:~$ **sass import.scss all.min.css --style compressed --watch**

---

### PRISM

<https://prismjs.com>

```html
<script>
var code = "";
const prismjs = require("prismjs");
try {
    code = prismjs.tokenize(code, prismjs.languages.javascript, "javascript");
} catch(e) {
    code = prismjs.highlight(code, prismjs.languages.javascript, "javascript");
}
</script>
```
