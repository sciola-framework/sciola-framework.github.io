function ajax(url) {
    $.ajax({
      url: url,
      headers: {"Accept": "application/vnd.github.html"}
    }).done(function(data) {
        $("main").html('<div class="w-100 m-0 p-4">' + data + '</div>');
    });
}

function router(e) {
    let path = window.location.href.split(window.location.origin)[1];
    if (route[path]) {
        $("main").html('<div class="text-center text-white bg-primary rounded fs-5 m-4 p-4">Loading...</div>');
        e.preventDefault();
        return ajax(route[path]);
    }
    $("main").html('<!DOCTYPE html><html><head><title>404 Not Found</title></head><body><h1 style="background: #ccc; padding: 25px">HTTP Status - 404 Not Found</h1><p>The requested URL was not found on this server.</p><hr><address>' + window.location.href + '</address></body></html>');
}

window.addEventListener("load", router);
window.addEventListener("hashchange", router);
