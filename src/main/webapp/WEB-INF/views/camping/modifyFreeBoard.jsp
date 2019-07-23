<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="../resources/css/global.css" rel="stylesheet" />
<link href="../resources/css/page.css" rel="stylesheet"/>
<link href="../resources/css/common.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"></jsp:include>
	<div class="bd_cover">
	</div>
	<section>
	<div class="pom_wrap">
		<div class="pomNav">
			<nav class="nav_wrap">
			<div class="nav_con">
				<div class="nav_title">커뮤니티</div>
				<ul class="nav_menu">
					<li><a href="/noticeList.do">공지사항</a><span>&gt;</span></li>
					<li><a href="/freeBoard.do">자유게시판</a><span>&gt;</span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content">
			<form action="newFreeBoard.do" method="post">
			<div class="camping_board">
				<input type="hidden" name="nickname" value="${sessionScope.member.nickname }">
				<input type="hidden" name="type" value="${fb.boardNo }">
				제목 : <input type="text" id="title" name="title" id="title" style="width: 86%;  background: #eee;  border: none;" value="${fb.title }">
			</div>
			<div class="d1">
				<textarea id="contents" name="contents">${fb.contents}</textarea>
			</div>
			<div class="write_btn">
				<button type="button" id="submit_btn" class="camping_notice_btn">등록</button>
                <button type="button" class="camping_notice_btn" data-dismiss="modal" onclick="location.href='/mainBoard.do'">취소</button>
           	</div>
           	</form>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$('#submit_btn').click(function(){
				var no = '${fb.boardNo}';
				var title = $('#title').val();
				var contents = $('#contents').val();
				var data = "title="+title+"&contents="+contents+"&boardNo="+no;
				$.ajax({
					url:"/modifyCompleteFreeBoard.do",
					type : "post",
					data : data,
					success : function(data){
						alert(data);
						location.href="/freeBoard.do";
					},
					error : function(){
						alert("실패다");
					}
				});
			});
		});
	</script>
	
	
</body>
</html>