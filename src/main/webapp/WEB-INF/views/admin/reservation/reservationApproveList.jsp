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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap">
		<div class="lnb_con">
			<div class="lnb_show">예약 관리</div>
			<ul class="lnb_menu">
				<li><a href="#none" class="menu_name">예약 관리</a>
					<ul class="lnb_sub_menu">
						<li><a href="/reservationAdminPage.do">예약 승인,취소</a></li>
						<li><a href="/reservationApproveList.do">예약 승인 리스트</a></li>
					</ul></li>
			</ul>
		</div>
		</nav>
		<div class="section_content">
                <div class="set_field">
					<h1>예약 승인,취소</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="list_field_box">
					<div class="list_field_inner">
						<div class="list_field_con">
							<p class="cancellationList">예약 대기</p>
							<table class="list_table">
								<thead>
									<tr>
										<th style="width:5%;"></th>
										<th style="width:21%;">예약번호</th>
										<th style="width:10%;">예약자</th>
										<th style="width:54%;">예약날짜</th>
										<th style="width:10%;">결제가격</th>
									</tr>
								</thead>
								<tbody id="payment1">
									<c:forEach items="${list1 }" var ="vo1" varStatus="i">
									<tr id="list1tr${i.count }" style="display:none;">
										<td><input type="checkbox" name="reservationId1" value="${vo1.reservationId }"></td>
										<td>${vo1.reservationId }</td>
										<td>${vo1.reservationName }</td>
										<td style="overflow:auto;">${vo1.reservationDate }</td>
										<td>${vo1.totalCost }</td>
									</tr>	
									</c:forEach>
									<tr>
										<td colspan="5">
										<a id="prev1" href="javascript:prev(1)" style="display:none;"><</a>
											<c:forEach var="i" begin="1" end="${page1 }">
												<c:choose>
													<c:when test="${i >5 }">
														<a id="list1a${i }" class="listpage1" href="javascript:paging(1,${i })" style="display:none;">${i }</a>
													</c:when>
													<c:otherwise>
														<a id="list1a${i }" class="listpage1" href="javascript:paging(1,${i })">${i }</a>
													</c:otherwise>
												</c:choose>	
											</c:forEach>
										<a id="next1" href="javascript:next(1)" style="display:none;">></a>
										
										</td>
									</tr>	
								</tbody>
							</table>
							<button type="button" class="button button1" onclick="reservationUpdate('cancel')">취소</button>
							<button type="button" class="button button1" onclick="reservationUpdate('approve')">승인</button>
						</div>
						<div class="list_field_con">
							<p class="cancellationList">예약 승인</p>
							<table class="list_table" style="table-layout: fixed;">
								<thead>
									<tr>
										<th style="width:21%;">예약번호</th>
										<th style="width:10%;">예약자</th>
										<th style="width:59%;">예약날짜</th>
										<th style="width:10%;">결제가격</th>
									</tr>
								</thead>
								<tbody id="payment2">
									<c:forEach items="${list2 }" var ="vo2" varStatus="i">
									<tr id="list2tr${i.count }" style="display:none;">
										<td>${vo2.reservationId }</td>
										<td>${vo2.reservationName }</td>
										<td style="overflow:auto;">${vo2.reservationDate }</td>
										<td>${vo2.totalCost }</td>
									</tr>	
									</c:forEach>
									<tr>
										<td colspan="4">
										<a id="prev2" href="javascript:prev(2)" style="display:none;"><</a>
											<c:forEach var="i" begin="1" end="${page2 }">
												<c:choose>
													<c:when test="${i >5 }">
														<a id="list2a${i }" class="listpage2" href="javascript:paging(2,${i })" style="display:none;">${i }</a>
													</c:when>
													<c:otherwise>
														<a id="list2a${i }" class="listpage2" href="javascript:paging(2,${i })">${i }</a>
													</c:otherwise>
												</c:choose>	
											</c:forEach>
										<a id="next2" href="javascript:next(2)" style="display:none;">></a>
										
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
					</div>
					<div class="list_field_inner">
						<div class="list_field_con">
							<p class="cancellationList">예약 취소 대기</p>
							<table class="list_table" style="table-layout: fixed;">
								<thead>
									<tr>
										<th style="width:5%;"></th>
										<th style="width:21%;">예약번호</th>
										<th style="width:10%;">예약자</th>
										<th style="width:54%;">예약날짜</th>
										<th style="width:10%;">결제가격</th>
									</tr>
								</thead>
				
								<tbody id="payment3">
									<c:forEach items="${list3 }" var ="vo3" varStatus="i">
									<tr id="list3tr${i.count }" style="display:none;">
										<td><input type="checkbox" name="reservationId2" value="${vo3.reservationId }"></td>
										<td>${vo3.reservationId }</td>
										<td>${vo3.reservationName }</td>
										<td style="overflow:auto;">${vo3.reservationDate }</td>
										<td>${vo3.totalCost }</td>
									</tr>	
									</c:forEach>
									<tr>
										<td colspan="5">
										<a id="prev3" href="javascript:prev(3)" style="display:none;"><</a>
											<c:forEach var="i" begin="1" end="${page3 }">
												<c:choose>
													<c:when test="${i >5 }">
														<a id="list3a${i }" class="listpage3" href="javascript:paging(3,${i })" style="display:none;">${i }</a>
													</c:when>
													<c:otherwise>
														<a id="list3a${i }" class="listpage3" href="javascript:paging(3,${i })">${i }</a>
													</c:otherwise>
												</c:choose>	
											</c:forEach>
										<a id="next3" href="javascript:next(3)" style="display:none;">></a>
										
										</td>
									</tr>	
								</tbody>
							</table>
							<button type="button" class="button button1" onclick="reservationUpdate('cancelapprove')">취소확정</button>
						</div>
						
						<div class="list_field_con">
							<p class="cancellationList">예약 취소</p>
							<table class="list_table" style="table-layout: fixed;">
								<thead>
									<tr>
										<th style="width:21%;">예약번호</th>
										<th style="width:10%;">예약자</th>
										<th style="width:59%;">예약날짜</th>
										<th style="width:10%;">결제가격</th>
									</tr>
								</thead>
								<tbody id="payment4">
									<c:forEach items="${list4 }" var ="vo4" varStatus="i">
									<tr id="list4tr${i.count }" style="display:none;">
										<td>${vo4.reservationId }</td>
										<td>${vo4.reservationName }</td>
										<td style="overflow:auto;">${vo4.reservationDate }</td>
										<td>${vo4.totalCost }</td>
									</tr>	
									</c:forEach>
									<tr>
										<td colspan="4">
										<a id="prev4" href="javascript:prev(4)" style="display:none;"><</a>
											<c:forEach var="i" begin="1" end="${page4 }">
												<c:choose>
													<c:when test="${i >5 }">
														<a id="list4a${i }" class="listpage4" href="javascript:paging(4,${i })" style="display:none;">${i }</a>
													</c:when>
													<c:otherwise>
														<a id="list4a${i }" class="listpage4" href="javascript:paging(4,${i })">${i }</a>
													</c:otherwise>
												</c:choose>	
											</c:forEach>
										<a id="next4" href="javascript:next(4)" style="display:none;">></a>
										
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>
</html>