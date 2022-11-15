var route = {};

$.getJSON("routes.json", function (json) {
    route = json;
});

function ajax(url) {
    $.ajax({
    url: url,
      headers: {"Accept": "application/vnd.github.html"}
    }).done(function(data) {
      $("main").html('<div class="bg-white rounded w-100 m-0 p-4">' + data + '</div>');
    });
}

function router(e) {
    let href = window.location.href;
    let hash = href.split(window.location.origin)[1];
    alert(hash);
    if (route[hash]) {
        $("main").html('<div class="text-center text-white bg-primary rounded fs-4 w-100 m-0 p-4">Loading...</div>');
        return ajax(route[hash]);
    }
}

window.addEventListener("load", router);
window.addEventListener("hashchange", router);
