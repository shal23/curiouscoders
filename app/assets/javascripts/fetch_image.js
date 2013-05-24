/* Fetch website image */
$("#post_content").bind('paste', function(e) {
    var el = $(this);
    setTimeout(function() {
        var text = $(el).val();
        // send text to server
    }, 100);
});