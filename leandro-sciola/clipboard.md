# Clipboard

---
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
