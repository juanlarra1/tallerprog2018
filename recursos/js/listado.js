function loadListado(e) {
    $('input[name=pag]').val($(e).data('page'))

    $.post({
        url: $('#listForm')[0].action + "&ajax=ajax",
        type: 'POST',
        data: $('#listForm').serialize(),
        success: function (data) {
            $("#content").html(data);

        }
    })
}
