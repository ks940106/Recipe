<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 대표 카라반</title>
<link rel="stylesheet" type="text/css"href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css"href="../resources/css/jquery-ui.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap">
		<div class="lnb_con">
			<div class="lnb_show">카라반</div>
			<ul class="lnb_menu">
				<li><a href="#none" class="menu_name">카라반 관리</a>
					<ul class="lnb_sub_menu">
						<li><a href="/seletecaravan.do">카라반 리스트</a></li>
						<li><a href="/caravanMainImg.do">대표 카라반 리스트</a></li>
					</ul></li>
			</ul>
			
		</div>
		</nav>
		<div class="section_content">
				<div class="set_field">
					<h1>대표카라반 리스트</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="list_field">
				<form action="/updaterepresentationCaravan.do">
				<button class="button button1" type="submit" id="updaterepresentationCaravan">수정</button>
				<table class="list_table">
					<thead>
						<tr>
							<td></td>
							<td>이름</td>
							<td>평수</td>
							<td>최소인원</td>
							<td>최대인원</td>
							<td>추가인원 금액</td>
							<td>가격</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="c" >
							<tr>
								<td><input type="checkbox" name="caravanNo" value="${c.caravanNo }"></td>
								<td>${c.caravanName}</td>
								<td>${c.caravanArea}</td>
								<td>${c.caravanPeople}</td>
								<td>${c.caravanMaxPeople}</td>
								<td>${c.caravanPlusCost}</td>
								<td>${c.caravanCost }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</div>
	</section>
		<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
		<script type="text/javascript" src="/resources/js/caravan.js"></script>
</body>
</html>