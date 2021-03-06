var delImg = [];
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
        $(e).closest('div').find('input[type="hidden"]').eq(1).val(1);


    },

    delImg: function (e) {
        var name = $(e).closest('div').find('input').prop('name');
        if (name) {
            var num = name.substr(name.length - 1);
            // $('#isDel_' + num).val(1);
        }
        $(e).closest('div').find('input[type="file"]').val('');

        $(e).closest('div').find('input[type="hidden"]').eq(2).val(1);
        $(e).closest('div').find('img').remove();
        $(e).remove();
    }

};



function uploadImg(e){
    $(e).siblings().trigger('click');
}
//imgUpload

// $('.img_box .upload_btn').on('click', function () {
//     $(this).siblings().trigger('click');
// });

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
function video_preview() {
    var iframe_src = $('#cok_video_url').val();
    // https://youtu.be/VpDSxXlWEf0
    if(iframe_src.length >0) {
        var strarr = iframe_src.match(/youtu\.be.*(.{11})/);
        var youtube_video_id="";
        console.log(strarr);
        if(strarr!=null)
            youtube_video_id = strarr.pop();
        if (youtube_video_id.length == 11) {
            var video_thumbnail = "//img.youtube.com/vi/" + youtube_video_id + "/0.jpg";
            $('#videoPhotoHolder').attr('src', video_thumbnail);
        }
    }
}

step = 1;
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
    video_preview();
    // console.log($("#divStepArea").html().trim().length);
    if($("#divStepArea").html().trim().length == 0)
        addStep();
    $(".step").hover(function () {
        $(this).find('.step_btn').show();
    },function () {
        $(this).find('.step_btn').hide();
    });

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
    $(".step input[name='step_no[]']").each(function (index,e) {
        $(e).val((index+1));
    });
    $(".step_btn").each(function (index,e) {
        $(e).find('a').eq(0).attr("href","javascript:addStep("+(index+1)+")");
        $(e).find('a').eq(1).attr("href","javascript:delStep("+(index+1)+")");
    });
}

function delStep(i) {
    console.log(i);
    var img = $('#divStepArea input[name="origin_step_img"]').eq(i-1).val();
    console.log(img);
    delImg.push(img);
    console.log(delImg);
    $("#divStepArea>div:nth-child("+i+")").remove();
    stepNum();
}

//upload form
function doSubmit(option) {
    var title = $("#cok_title").val();
    var mainImg = $("#recipeMainImg").val();
    if(option === 'save'&&!title.length){
        alert("레시피 제목은 필수사항 입니다.");
        return;
    }else if (option === 'save'&&!mainImg.length){
        alert("요리 대표사진은 필수사항 입니다.");
        return;
    }
    // var step_photo = $("#divStepArea input[name='step_photo[]']");
    var formData = new FormData($("#recipeForm")[0]);
    var steps = [];
    $('#divStepArea [name="step_text[]"]').each(function () {
        // steps.push($(this).val());
        formData.append('steps',$(this).val());
    });
    delImg.forEach(function (value, index, array) {
        console.log(value);
       formData.append("delImg",value);
    });
    // var json_arr = JSON.stringify(steps);

    var recipe_state = 1;
    var url;
    if(option === 'save'){
        url = "/recipeReg.do";
        recipe_state = 1;
    }

    if(option === 'delete'){
        url = "/recipeDel.do";
        recipe_state = 0;
    }

    if(option === 'update'){
        url = "recipeUpdate.do";
        recipe_state = 1;
    }

    formData.append('recipe_state',recipe_state);

    $.ajax({
        type:"post",
        url:url,
        data:formData,
        processData:false,
        contentType:false,
        success:function (html) {
            switch (option) {
                case 'save':
                    alert("레시피가 등록 되었습니다.");
                    location.href="/recipePage.do";
                    break;
                case 'update':
                    alert("레시피가 수정 되었습니다.");
                    location.href="/myRecipe.do";
                    break;
                case 'delete':
                    alert("레시피가 삭제 되었습니다.");
                    location.href="/myRecipe.do";
                    break;
            }

        },
        error:function (error) {
            alert("에러가 발생했습니다. 관리자에게 문의하세요.");
            console.log(error);
            console.log(error.status);
        }
    })

}

function like (recipeNo) {
    $.ajax({
        url:"/recipeLike.do",
        data: {recipeNo:recipeNo},
        success:function (message) {
            alert(message);
            location.reload();
        }
    })
}

function unLike(recipeNo) {
    $.ajax({
        url:"/recipeUnLike.do",
        data: {recipeNo:recipeNo},
        success:function (message) {
            alert(message);
            location.reload();
        }
    })
}

var total = $("#price").html();
var count = 1;
$("input[name='count']").change(function () {
    count = $(this).val();
    total = $("#price").html()*$(this).val();
    $("#total_price").text(total);
});

function cart(recipeNo) {
    location.href = "/insertcart.do?recipeNo=" + recipeNo + "&count=" + count;
}



//슬라이드


//current position
  var pos = 0;
  //number of slides
  var totalSlides = $('.slider-wrap001 ul#slider001 li').length;
  //get the slide width
  var sliderWidth = $('.slider-wrap001').width();
      
      /*****************
       BUILD THE SLIDER
      *****************/
      //set width to be 'x' times the number of slides
      $('.slider-wrap001 ul#slider001').width(sliderWidth*totalSlides);
      
    /*  //next slide    
      $('#recipe_next').click(function(){
          slideRight();
      });
      
      //previous slide
      $('#recipe_previous').click(function(){
          slideLeft();
      });*/
      
      
      
      /*************************
       //*> OPTIONAL SETTINGS
      ************************/
      //automatic slider
      var autoSlider = setInterval(slideRight, 5000);
      
      //for each slide 
      $.each($('.slider-wrap001 ul#slider001 li'), function() { 

         //create a pagination
         var li = document.createElement('li');
         $('#pagination-wrap001 ul#slider001').append(li);    
      });
      
      //counter
      countSlides();
      
      //pagination
      pagination();
      
      //hide/show controls/btns when hover
      //pause automatic slide when hover
      $('.slider-wrap001').hover(
        function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
        function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
      );
      
      


      


  /***********
   SLIDE LEFT
  ************/
  function slideLeft(){
      pos--;
      if(pos==-1){ pos = totalSlides-1; }
      $('.slider-wrap001 ul#slider001').css('left', -(sliderWidth*pos));    
      
      //*> optional
      countSlides();
      pagination();
  }


  /************
   SLIDE RIGHT
  *************/
  function slideRight(){
      pos++;
      if(pos==totalSlides){ pos = 0; }
      $('.slider-wrap001 ul#slider001').css('left', -(sliderWidth*pos)); 
      
      //*> optional 
      countSlides();
      pagination();
  }



      
  /************************
   //*> OPTIONAL SETTINGS
  ************************/
  function countSlides(){
      $('#counter001').html(pos+1 + ' / ' + totalSlides);
  }

  function pagination(){
      $('#pagination-wrap001 ul li').removeClass('active');
      $('#pagination-wrap001 ul li:eq('+pos+')').addClass('active');
  }


