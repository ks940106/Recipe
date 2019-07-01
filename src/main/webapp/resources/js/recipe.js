var boardReg	=	{


    imgSel: function (e, event) {

        var ext = $(e).val().split(".").pop().toLowerCase();

        if (ext.length > 0) {
            if ($.inArray(ext, ["gif", "png", "jpg", "jpeg"]) == -1) {
                alert("gif,png,jpg만 가능합니다.");
                var file = $(e);

                var agent = navigator.userAgent.toLowerCase();
                if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
                    file.replaceWith(file.clone(true));
                } else {
                    file.val("");
                }
                return false;
            }
        }
        $(e).closest('div').find('img').remove();
        $(e).closest('div').find('.del_btn').remove();

        var str = '';
        str += '<img src="' + URL.createObjectURL(event.target.files[0]) + '" alt="이미지">';
        str += '<a href="#none" class="del_btn" onclick="boardReg.delImg(this)">삭제</a>';
        $(e).closest('div').append(str);


    },

    delImg: function (e) {
        var name = $(e).closest('div').find('input').prop('name');
        if (name) {
            var num = name.substr(name.length - 1);
            $('#isDel_' + num).val(1);
        }
        $(e).closest('div').find('input').val('');
        $(e).closest('div').find('img').remove();
        $(e).remove();
    }

};


//imgUpload

$('.img_box .upload_btn').on('click', function () {



    $(this).siblings().trigger('click');

});



