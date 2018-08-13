$(document).ready(function () {


    $('#userPager li a').bind("click", function () {
        $.ajax({
            url: this.href + "&esAdmin=" + $("#adminFilter").value + "&ajax=ajax",
            success: function (data) {
               $("#content").html(data);

            }
        })
    })

});