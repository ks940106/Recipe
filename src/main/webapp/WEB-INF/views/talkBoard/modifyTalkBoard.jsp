<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />

	<section>
	<div class="pom_bg">
		<div class="pom_top">
			<h1>토크</h1>
			<div id="pom_div_bg"></div>
			<p>나만의 특별한 하루를 공유해요</p>
		</div>
	</div>
	<div class="pom_wrap">
		<form action="/modifyCompleteTalkBoard.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardNo" value="${tb.boardNo }"> 
			<input type="hidden" name="boardType" value="${tb.boardType }">
			<input type="hidden" name="nickname" value="${sessionScope.member.nickname}">
			<div class="pomNav">
				<jsp:include page="/WEB-INF/views/talkBoard/talkBoardNav.jsp" />
			</div>
			<div class="section_content">
				<div class="board_type">
					<div class="board_left">
						<span><p>전체글을 볼수 있어요</p></span>
					</div>
				</div>
				<div class="d1">
					<textarea id="contents" name="boardContents">${tb.boardContents }</textarea>
				</div>
				<div class="img_box">
				
					<div id="attach">
					<input type="hidden" name="fullImg" value="${tb.boardImg }">
						<div id="attach2">
							<input type="hidden" id="imgN" value="${fn:length(img) }">
							<input class="uploadInputBox" type="file" id='img_${fn:length(img)}' name="filedata">
						</div>
						<c:forTokens items="${tb.boardImg }" delims="/" var="item"	varStatus="status">
							<div class="preview" value="${status.index }"  >
								<input type="hidden" name="oneImg" value="${item}">
								 <img class="thumbnail" onclick="deletePreview(this)" src="/resources/talkBoard/${item }" value="${status.index }">
								<p style='display: none'>${item }</p>
							</div>
						</c:forTokens>
						
					</div>
				</div>
				<div class="write_btn">
					<button type="submit" id="submit_btn" class="btn-lg btn-primary">등록</button>
					<button type="button" class="btn-lg btn-default"
						data-dismiss="modal" onclick="location.href='/mainBoard.do'">취소</button>
				</div>
			</div>
		</form>
	</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
	
	
	<script>
	 $(document).ready(function(){
		 var imgN = $("#imgN").val();
		 console.log(imgN);
		 	var files = {};
			var no = $('.preview:last').attr('value');
			var previewIndex = ++no;
	 });
		
			$(document).on('change','.uploadInputBox',function() {
								imgN++;
								$(this).css('display', 'none');
								$('#attach2').append("<input class='uploadInputBox' id='img_"+imgN+"' type='file' name='filedata'/>");
							});

			//임의의 file object영역
			// image preview 기능 구현
			// input = file object[]
			function addPreview(input) {
				if (input[0].files) {
					//파일 선택이 여러개였을 시의 대응
					for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
						var file = input[0].files[fileIndex];

						if (validation(file.name))
							continue;
						setPreviewForm(file);
					}
				} else
					alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
			}

			function setPreviewForm(file, img) {

				var reader = new FileReader();
				reader.onload = function(img) {
					//div id="preview" 내에 동적코드추가.
					//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.

					var imgNum = previewIndex++;
					$("#attach")
							 .append(
	                                        "<div class=\"preview\" value=\"" + imgNum +"\">"
	                                                + "<img href='#:;' class=\"thumbnail\" onclick='deletePreview(this)' value="+imgNum+" src=\"" + img.target.result + "\"\/>"
	                                                + "<p style='display:none'>"
	                                                + file.name
	                                                + "</p><br>"
	                                                +"<input type='hidden' name='fileName' value='"+file.name+"'>"
	                                                + "</div>");
					files[imgNum] = file;
				};
				reader.readAsDataURL(file);
			}

			//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
			function deletePreview(obj) {
				console.log(obj);
				var imgNum = obj.attributes['value'].value;
				console.log(imgNum);
				delete files[imgNum];
				$(".preview[value=" + imgNum + "]").remove();
				$("#img_" + imgNum + "").remove();
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

			$(document).on('click', '.uploadInputBox', function() {
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