function ajax(url) {
    $.ajax({
      url: url,
      headers: {"Accept": "application/vnd.github.html"}
    }).done(function(data) {
        $("main").html('<div class="w-100 m-0 p-4">' + data + '</div>');
    });
}

function router(e) {
    let path  = window.location.href.split(window.location.origin)[1];
    if (route[path]) {
        $("main").html('<div class="text-center text-white bg-primary rounded fs-5 w-100 m-4 p-4">Loading...</div>');
        e.preventDefault();
        return ajax(route["/"] + route[path]);
    }
    return false;
}

window.addEventListener("load", router);
window.addEventListener("hashchange", router);
