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
            // $('#isDel_' + num).val(1);
        }
        $(e).closest('div').find('input').val('');
        $(e).closest('div').find('img').remove();
        $(e).remove();
    }

};


//imgUpload

// $('.img_box .upload_btn').on('click', function () {
//     $(this).siblings().trigger('click');
// });
function uploadImg(e){
    $(e).siblings().trigger('click');
}

$('#cok_video_url').blur(function () {
    var iframe_src       = $('#cok_video_url').val();
    // https://youtu.be/VpDSxXlWEf0
    var youtube_video_id = iframe_src.match(/youtu\.be.*(.{11})/).pop();
    console.log(youtube_video_id);
    if (youtube_video_id.length == 11) {
        var video_thumbnail = "//img.youtube.com/vi/"+youtube_video_id+"/0.jpg";
        $('#videoPhotoHolder').attr('src',video_thumbnail);
    }
});

var step = 1;
var content = $("#divStepTemplate").html();
function addStep(i) {
    if(i == null){
        $("#divStepArea").append(content.replace(/STEP/g,step));
        step++;
    } else {
        $("#divStepArea>div:nth-child("+i+")").after(content.replace(/STEP/g,i+1));
        step++;
    }
    stepNum();
    $(".step").hover(function () {
        $(this).find('.step_btn').show();
    },function () {
        $(this).find('.step_btn').hide();
    });
}

$(document).ready(function () {
    addStep();
    $(".ui-sortable").sortable({
        update:function(event,ui){
            stepNum();
        }
    });
});
function stepNum() {
    $(".step>p").each(function (index,e) {
       $(e).text("Step"+(index+1));
    });
    $(".step_btn").each(function (index,e) {
       $(e).find('a').eq(2).attr("href","javascript:addStep("+(index+1)+")");
       $(e).find('a').eq(3).attr("href","javascript:delStep("+(index+1)+")");
    });
}

function delStep(i) {
    $("#divStepArea>div:nth-child("+i+")").remove();
    stepNum();
}

//upload form
function doSubmit(option) {
    if (option === 'save_public') {
        var step_photo = $("#divStepArea input[name='step_photo[]']");
        var formData = new FormData($("#recipeForm")[0]);
        var array = ['a','b','c','d'];
        var json_arr = JSON.stringify(array);
        formData.append('array',json_arr);
        $.ajax({
            type:"post",
            url:"/recipeReg.do",
            data:formData,
            processData:false,
            contentType:false,
            success:function (html) {
                alert("파일 업로드성공");
            },
            error:function (error) {
                alert("파일업로드 실패");
                console.log(error);
                console.log(error.status);
            }
        })


    }
}
