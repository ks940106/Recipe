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
<link href="../resources/css/campingReset.css" rel="stylesheet" />
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
					<li><a href="/mypage.do">공지사항</a><span>&gt;</span></li>
					<li><a href="/cart.do">자유게시판</a><span>&gt;</span></li>
					<li><a href="/orderList.do">Q&A</a><span>&gt;</span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content">
			
			<div class="board_type">
				<input type="hidden" name="nickname" value="${sessionScope.member.nickname }">
				<input type="hidden" name="type" value="${no }">
				${fb.title }
				${fb.nickname }
			</div>
			<div class="d1">
				${fb.contents }
			</div>
			<input type="button" onclick="deleteFreeBoard(${fb.boardNo})" class="btn-lg btn-danger" value="삭제">
			<input type="button" onclick="modifyFreeBoard(${fb.boardNo})" class="btn-lg btn-success" value="수정">
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"></jsp:include>
	<script>
		function deleteFreeBoard(no){
			location.href="/deleteFreeBoard.do?boardNo="+no;
		}
		function modifyFreeBoard(no){
			location.href="/modifyFreeBoard.do?boardNo="+no;
		}
	</script>

</body>
</html>