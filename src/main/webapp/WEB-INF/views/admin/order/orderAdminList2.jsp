<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/jquery-ui.min.css">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-ui-1.12.1.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap">
		<div class="lnb_con">
			<div class="lnb_show">레시피 판매</div>
			<ul class="lnb_menu">
				<li><a href="#none" class="menu_name">판매 관리</a>
					<ul class="lnb_sub_menu">
						<li><a href="/competitionAdminResultList.do">결제 리스트</a></li>
						<li><a href="/competitionAdminList.do?competitionCheck='Y'">매출 현황</a></li>
					</ul></li>
			</ul>
		</div>
		</nav>
		<div class="section_content">
                <div class="set_field">
					<h1>결제 리스트</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="list_field_box">
					<div class="list_field_inner">
						<div class="list_field_con">
							<p class="cancellationList">결제 취소</p>
							<form action="/cancellationAdminOrder.do" method="post">
							<table class="list_table">
								<colgroup>
									<col width="20">
									<col width="20">
									<col width="50">
									<col width="100">
									<col width="220">
									
								</colgroup>
								<thead>
									<tr>
										<th></th>
										<th>주문 번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody id="payment">
								<!-- 
									<c:forEach items="${list}" var="c">
										<c:if test="${'결제취소대기중' eq c.state}">
										<tr>
											<td><input type="checkbox" name="orderNo" value="${c.orderNo }"></td>
											<td>${c.orderCode}</td>
											<td>${c.name}</td>
											<td>${c.phone }</td>
											<td>${c.state }</td>
										</tr>
										</c:if>
									</c:forEach>
								 -->
								</tbody>
							</table>
							<button type="submit" class="button button1" class="cancellation">취소확정</button>
							</form>
						</div>
						<div class="list_field_con">
							<p class="cancellationList">결제 진행중</p>
							<form action="/cancellationAdminOrder.do" method="post">
							<table class="list_table">
								<colgroup>
									<col width="20">
									<col width="20">
									<col width="50">
									<col width="100">
									<col width="220">
								
								</colgroup>
								<thead>
									<tr>
										<th></th>
										<th>주문 번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="c">
										<c:if test="${'결제진행중' eq c.state}">
										<tr>
											<td><label> <input type="checkbox" name="orderNo" value="${c.orderNo }">
											</label></td>
											<td>${c.orderCode}</td>
											<td>${c.name}</td>
											<td>${c.phone }</td>
											<td>${c.state }</td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							
							<button type="button" class="button button1" id="cancellation">결제완료</button>
							<button type="submit" class="button button1">결제취소</button>
							
							</form>
						</div>
					</div>
					<div class="list_field_inner">
						<div class="list_field_con">
							<p class="cancellationList">결제 완료</p>
							<form action="cancellationAdminOrder.do" method="post">
							<table class="list_table">
								<colgroup>
								
									<col width="150">
									<col width="50">
									<col width="100">
									<col width="220">
								
								</colgroup>
								<thead>
									<tr>
										<th>주문 번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="c">
										<c:if test="${'결제완료' eq c.state}">
										<tr>
											<td>${c.orderCode}</td>
											<td>${c.name}</td>
											<td>${c.phone }</td>
											<td>${c.state }</td>
										</tr>
										</c:if>
									</c:forEach>	
								</tbody>
							</table>
							</form>
						</div>
						<div class="list_field_con">
							<p class="cancellationList">결제취소완료</p>
							<table class="list_table">
								<colgroup>
								
									<col width="150">
									<col width="50">
									<col width="100">
									<col width="220">
									
								</colgroup>
								<thead>
									<tr>
										<th>주문 번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="c">
										<c:if test="${'결제취소완료' eq c.state}">
										<tr>
											<td>${c.orderCode}</td>
											<td>${c.name}</td>
											<td>${c.phone }</td>
											<td>${c.state }</td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							
						</div>
					</div>
				</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
	<script type="text/javascript" src="/resources/js/Adminorder.js"></script>
</body>
</html>