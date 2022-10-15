# Clipboard

[Javascript | DEMO - PROMISE](https://jsfiddle.net/dgvk612x/)

```
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