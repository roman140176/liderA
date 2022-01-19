$(document).ready(function () {
    var originalPos = null;
    var data = {};
    var keysEl = $('.sortOrder');
    data[keysEl.data('token-name')] = keysEl.data('token');

    var sortableHelper = function (a, el) {
        originalPos = el.prevAll().length;
        var helper = el.clone();

        return helper;
    };

    $('.sort-imgs').sortable({
        helper: sortableHelper,
        update: function (event, ui) {
            var pos = $(ui.item).prevAll('.image-wrapper').length;

            if (originalPos !== null && originalPos != pos) {
                var keys = keysEl.children('span');
                var key = keys.eq(originalPos);
                var sort = [];

                keys.each(function (i) {
                    sort[i] = $(this).attr('data-order');
                });

                if (originalPos < pos) {
                    keys.eq(pos).after(key);
                }
                if (originalPos > pos) {
                    keys.eq(pos).before(key);
                }
                originalPos = null;
            }
            var sortOrder = {};
            keys = keysEl.children('span');
            keys.each(function (i) {
                $(this).attr('data-order', sort[i]);
                sortOrder[$(this).text()] = sort[i];
            });

            data["sortOrder"] = sortOrder;
            // console.log(sortOrder)
            $.ajax({
                type: "POST",
                url: keysEl.data('action'),
                data: data
            });
        }
    });


    function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.preview-image-wrapper').removeClass('hidden');
            $('.preview-image').attr('src', e.target.result).show();
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function readImageURL(input, classImage) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            // $(classImage+'-wrapper').removeClass('hidden');
            $(classImage+'').attr('src', e.target.result).show();
        };

        reader.readAsDataURL(input.files[0]);
    }
}
});