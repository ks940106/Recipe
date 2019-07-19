<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 공지사항 </title>
<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/search.js"></script>
	<script src="../resources/js/include.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" /> 
	<section class="noticeUpdate">
		<div class="wrapper">
	        <nav class="lnb_wrap">
	             <jsp:include page="/WEB-INF/views/common/notice_nav.jsp"/>
	        </nav>
			<div class="section_content">
				<div class="admin_notice_div">
					<form action="/noticeUpdate.do" method="post" onsubmit="return insert()">
						<input type="hidden" name="idx" value="${n.idx }">
				<div class="set_field">
					<h1>공지사항 수정</h1>
					<div id="cp_div_bg"></div>
				</div>
				<table class="adminNotice">
					<tr>
						<th>공지사항 제목</th>
						<td><input type="text" name="noticeTitle" id="title" value="${n.noticeTitle }"></td>
						<th>공지사항 작성일</th>
						<td>${n.noticeDate }</td>
					</tr>
					
						
					
					<tr>
						<th>공지사항 내용</th>
						<td colspan="3"><textarea rows="20" cols="20" id="content" name="noticeContent">${n.noticeContent }</textarea>
				</table>
			<button type="submit">수정</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp" />
	<script type="text/javascript" src="/resources/js/talkBoard/noticeWrite.js"></script>
</body>
</html>