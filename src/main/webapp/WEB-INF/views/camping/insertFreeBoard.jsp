<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/campingReset.css" rel="stylesheet" />
<link href="../resources/css/global.css" rel="stylesheet" />
<link href="../resources/css/page.css" rel="stylesheet"/>
<link href="../resources/css/common.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
<script src="../resources/js/freeBoard/insertFreeBoard.js"/>
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
			<form action="newFreeBoard.do" method="post" onsubmit="return check()">
			<div class="camping_board">
				<input type="hidden" id="nickname" name="nickname" value="${sessionScope.member.nickname }">
				<input type="hidden" id="type" name="type" value="${no }">
				<input type="text" id="title" name="title" id="title" style="width: 86%;  background: #eee;  border: none; height: 30px;">
			</div>
			<div class="d1">
				<textarea id="contents" name="contents"></textarea>
			</div>
			<div class="write_btn">
                <button type="button" id="submit_btn" class="camping_notice_btn">등록</button>
                <button type="button" class="camping_notice_btn" data-dismiss="modal" onclick="location.href='/freeBoard.do'">취소</button>
           	</div>
           	</form>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"></jsp:include>

</body>
</html>