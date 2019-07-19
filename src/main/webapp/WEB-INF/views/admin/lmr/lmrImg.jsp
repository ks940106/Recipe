<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 이달의 레시피 혜택 배너 수정</title>
<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/search.js"></script>
	<script src="../resources/js/include.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<link href="../resources/css/tmr.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/js/tmr.js" /> 
</head>
<body>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" /> 

	<section>
		<div class="wrapper">
	        <nav class="lnb_wrap">
	             <jsp:include page="/WEB-INF/views/admin/lmr/lmrAdminNav.jsp"/>
	        </nav>
			<div class="section_content">
				<div class="set_field">
					<h1>이달의 레시피 혜택 배너 관리</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="cp_content" style="margin-left:100px;">
				<br>
				<form action="/lmrUpload.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="originfile" value="${img }">
					<div>
					<img id="beforeImg" src="/../resources/upload/tmr/${img }" style="width:500px; height:500px; position: relative;">
					<button id="cancelBt" class="btn btn-danger" type="button" style="position:absolute;">X</button>
					<label for="file">
					<div id="uploadImg" style="width:500px; height:495px; display: none; padding:200px; border: 1px solid lightgray">
					<img src="/../resources/img/tmr/upload.png" style="width:100px; height: 100px;" accept="image/*">
					</div>
					</label>
					
					</div>
					<input id="file" type="file" name="file" style="display: none;" onchange="loadImg(this)"><br>
					<input id="submitBt" class="btn btn-success btn-lg" type="submit" value="업로드" style="display:none;">
					<button class="btn btn-primary btn-lg" type="button" onclick="location.href='/lmr.do'">목록으로</button>
				</form>
				</div>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
<script>
$("#cancelBt").click(function(){
	$("#beforeImg").css("display","none");
	$("#cancelBt").css("display","none");
	$("#uploadImg").css("display","block");
	$("#submitBt").css("display","none");
});
function loadImg(f){
	if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
		var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
		reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
		reader.onload = function(e){
			$("#beforeImg").css("display","inline");
			$("#cancelBt").css("display","inline");
			$("#beforeImg").attr("src",e.target.result);
			$("#uploadImg").css("display","none");
			$("#submitBt").css("display","inline");
		}
	} else{ //파일을 뺄 경우
		$("#submitBt").css("display","none");
	}
}
var count;

</script>
</body>
</html>