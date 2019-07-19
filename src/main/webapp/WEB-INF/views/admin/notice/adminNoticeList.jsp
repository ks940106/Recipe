<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리 </title>
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
	<section>
		<div class="wrapper">
	        <nav class="lnb_wrap">
	             <jsp:include page="/WEB-INF/views/common/notice_nav.jsp"/>
	        </nav>
			<div class="section_content">
				<div class="set_field">
					<h1>공지사항 관리</h1>
					<div id="cp_div_bg"></div>
				</div>
				
				<div class="list_field">
					<table class="list_table">
						<colgroup>
							<col width="40">
							<col width="150">
							<col width="40">
							<col width="40">
							<col width="100">
							<col width="200">
							<col width="120">
							<col width="85">
							<col width="100">
						</colgroup>
						<thead>
						<tr>
							<th>공지사항 번호</th>
							<th>공지사항 제목</th>
							<th>등록일</th>
							<th>관리</th>
						</tr>
						</thead>
						<tbody>
						
						 <c:forEach items="${list.notice }" var="n">
						 
						 <tr>
							<td>${n.idx}</td>
							<td>${n.noticeTitle }</td>
							<td>${n.noticeDate }</td>
							<td>
								<div>
									<a href="/noticeUpdatePage.do?idx=${n.idx}" class="btn small col_main f_w">수정</a>
									<a href="/noticeDelete.do?idx=${n.idx}" class="btn small col_main f_w">삭제</a>
								</div>
							</td>
						</tr> 
						</c:forEach> 
						</tbody>
					</table>
				${list.pageNavi }
				</div>
				<a href="/noticeWritePage.do" class="btn small col_main f_w">게시글 작성</a>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>
</html>