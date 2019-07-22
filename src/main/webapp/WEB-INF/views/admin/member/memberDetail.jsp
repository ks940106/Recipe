<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 캠핑예약관리</title>
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
		<div class="lnb_con">
			<div class="lnb_show">회원관리</div>
			<ul class="lnb_menu">
				<li><a href="#none" class="menu_name">회원관리</a>
					<ul class="lnb_sub_menu">
						<li><a href="/reservationAdminPage.do">예약 승인,취소</a></li>
					</ul></li>
			</ul>
		</div>
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
								<%-- <tr>
										<th>예약자 생년월일</th>
										<td>${r.reservationBirth }</td>
								</tr>
								<tr>
										<th>예약자 연락처</th>
										<td>${r.reservationPhone }</td>
								</tr>
								<tr>
										<th>예약자 이메일</th>
										<td>${r.reservationEmail }</td>
								</tr>
								<tr>
										<th>예약자 요청사항</th>
										<td style="overflow: auto;">${r.reservationRequest }</td>
								</tr>
								<tr>
										<th>결제 날짜</th>
										<td>${r.enrollDate}</td>
								</tr>
								<tr>
										<th>예약 상태</th>
										<c:choose>
											<c:when test="${r.reservationState eq 1}">
												<td>예약 승인 대기 중</td>
											</c:when>
											<c:when test="${r.reservationState eq 2}">
												<td>예약 승인</td>
											</c:when>
											<c:when test="${r.reservationState eq 3}">
												<td>예약 취소 대기 중</td>
											</c:when>
											<c:otherwise>
												<td>예약 취소</td>
											</c:otherwise>
										</c:choose>
										
								</tr> --%>
					</table>
					<button class="button button1" onclick="location.href='/reservationAdminPage.do'">목록으로</button>
				</div>
		</div>
	</div>
	</section>
<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
	<script>
		
	</script>
</body>
</html>