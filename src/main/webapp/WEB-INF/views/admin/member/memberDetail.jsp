<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 회원관리</title>
<link rel="stylesheet" type="text/css"href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css"href="../resources/css/jquery-ui.min.css">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-ui-1.12.1.js"></script>
<style>
#reservationTable th{width: 100px;}
#reservationTable td{cursor: default; width: 500px;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap">
		<jsp:include page="/WEB-INF/views/common/member_nav.jsp"/>
		</nav>
		<div class="section_content">
                <div class="set_field">
					<h1>회원 상세보기</h1>
					<table id="reservationTable" class="list_table" style="table-layout: fixed;">
								<tr>
										<th>회원 이메일</th>
										<td>${m.id }</td>
								</tr>
								<tr>
										<th>회원이름</th>
										<td>${m.name }</td>
								</tr>
								<tr>
										<th>회원 닉네임</th>
										<td>${m.nickname }</td>
								</tr>
								<tr>
										<th>회원 성별</th>
										<td style="overflow: auto;">${m.gender }</td>
								</tr>
								<tr>
										<th>회원 전화번호</th>
										<td>${m.phone }</td>
								</tr>
								<tr>
										<th>회원 주소</th>
										<td>${m.addr1 } ${m.addr2 }</td>
								</tr>
								<tr>
										<th>회원 이미지</th>
										<td><img id="image_section" style="width: 200px" height="200px" src="../resources/upload/member/${m.memberImg}"/><br></td>
								</tr>
								
					</table>
					<button class="button button1" onclick="location.href='/memberList.do'">목록으로</button>
				</div>
		</div>
	</div>
	</section>
<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
	<script>
		
	</script>
</body>
</html>