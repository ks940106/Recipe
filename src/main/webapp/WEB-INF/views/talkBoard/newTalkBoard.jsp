<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<title>Insert title here</title>
<link href="../resources/css/import.css" rel="stylesheet" />
<style>
#preview img {
    width: 100px;
    height: 100px;
    box-sizing: border-box;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
    
}
.preview-box {
    border: 1px solid;
    padding: 5px;
    border-radius: 2px;
    margin-bottom: 10px;
    width: 150px;
    float: left;
    box-sizing: border-box;
}
#preview{
	border: 1px solid red;
	position: absolute;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp"/>

	<h1>글쓰기</h1>
	
	<form action="insertTalkBoard.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardType" value="요리톡">
		<input type="hidden" name="nickname" value="${sessionScope.member.nickname }">
		<textarea rows="30" cols="150" name="boardContents"></textarea>
		<br>
		<div id="attach">
             <input class="uploadInputBox" id="img_0" type="file" name="filedata"/>
             
         </div>
		<div id="preview"></div><br>
		
   		<br><br><br><br><br><br><br><br><br><br>
		<input type="submit" value="등록">
	</form>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
	
  <script>
   		var imgN = 1;
  		$(document).on('change','.uploadInputBox',function(){
  			$(this).css('display','none');
  			$('#attach').append("<input class='uploadInputBox' id='img_"+imgN+"' type='file' name='filedata'/>");
  			imgN++;
  		});
 	
        //임의의 file object영역
        var files = {};
        var previewIndex = 0;
        // image preview 기능 구현
        // input = file object[]
        function addPreview(input) {
        	console.log("addpreview");
        	
            if (input[0].files) {
                //파일 선택이 여러개였을 시의 대응
                console.log(input[0].files.length);
                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                    var file = input[0].files[fileIndex];
                    if(validation(file.name)) continue;
                    setPreviewForm(file);
                    console.log(file);
                    console.log(files);
                }
            } else
                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
        }
        function setPreviewForm(file, img){
                    var reader = new FileReader();
                        //div id="preview" 내에 동적코드추가.
                        //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                    reader.onload = function(img) {
                        var imgNum = previewIndex++;
                        $("#preview")
                                .append(
                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                + "<p style='display:none'>"
                                                + file.name
                                                + "</p><br>"
                                                +"<input type='hidden' name='fileName' value='"+file.name+"'>"
                                                + "<a href=\"#\" value=\""
                                                + imgNum
                                                + "\" onclick=\"deletePreview(this)\">"
                                                + "삭제" + "</a>" + "</div>");
                        files[imgNum] = file;
                    };
                    reader.readAsDataURL(file);
                }
        
        
 
        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
        function deletePreview(obj) {
            var imgNum = obj.attributes['value'].value;
            delete files[imgNum];
            $("#preview .preview-box[value=" + imgNum + "]").remove();
            $("#img_"+imgNum+"").remove();
        }
 
        //client-side validation
        //always server-side validation required
        function validation(fileName) {
            fileName = fileName + "";
            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
            var fileNameExtension = fileName.toLowerCase().substring(
                    fileNameExtensionIndex, fileName.length);
            if (!((fileNameExtension === 'jpg')
                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                return true;
            } else {
                return false;
            }
        }
 
        $(document).on('click','.uploadInputBox',function(){
            // <input type=file> 태그 기능 구현
            console.log("클릭");
            $(this).change(function() {
                addPreview($(this)); //preview form 추가하기
                console.log("프리뷰 추가");
            });
        });
       
    </script>
	
	
</body>
</html>