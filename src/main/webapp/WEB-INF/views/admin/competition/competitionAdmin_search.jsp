<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<!-- header Fin -->
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap"> 
			<jsp:include	page="/WEB-INF/views/common/competition_nav.jsp" />
		</nav>
		<div class="section_content">
			<div class="list_field">
				<div class="list_menu">
					<span class="left_menu">
						<a href="javascript:all_chk('y')" class="btn col_grey">전체선택</a>
						<a href="javascript:all_chk('n')" class="btn col_grey">전체해제</a>
						<a href="javascript:void(0)" class="btn col_darkGrey f_w">선택삭제</a>
					<span class="sbox ml15">
					<select>
						<option>상태 선택</option>
						<option>작업 대기</option>
						<option>작업 진행중</option>
						<option>완료</option>
					</select>
					</span>
						<a href="javascript:void(0)" class="btn col_darkGrey f_w">선택변경</a>
					</span>
				</div>
				<table class="list_table">
					<colgroup>
						<col width="40">
						<col width="45">
						<col width="220">
						<col width="100">
						<col width="220">
						<col width="80">
						<col width="80">
						<col width="120">
					</colgroup>
					<thead>
					<tr>
						<th>
							<label>
								<input type="checkbox" name="all_chk">
							</label>
						</th>
						<th>No</th>
						<th>품명</th>
						<th>수량</th>
						<th>재고위치</th>
						<th>메모</th>
						<th>상태</th>
						<th>상세정보</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<label>
								<input type="checkbox" name="">
							</label>
						</td>
						<td>2</td>
						<td>JVL-250</td>
						<td>17</td>
						<td>
							<div>G-A구역 / 5</div>
							<div>G-A구역 / 12</div>
						</td>
						<td>
							<a href="#none" class="btn col_grey smaller memo" onclick="memo_pop()">메모</a>
						</td>
						<td>
							<span class="tag col_darkGrey f_w">중지</span>
						</td>
						<td>
							<div>
								<a href="stock_info.html" class="btn small col_main f_w">상세정보</a>
							</div>
							<div>
								<a href="#none" class="btn small col_ash f_w">삭제</a>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="checkbox" name="">
							</label>
						</td>
						<td>1</td>
						<td>JVL-350</td>
						<td>55</td>
						<td>
							<div>G-A구역 / 1</div>
							<div>G-B구역 / 4</div>
							<div>G-C구역 / 50</div>
						</td>
						<td>
							<a href="#none" class="btn col_grey smaller memo" onclick="memo_pop()">메모</a>
						</td>
						<td>
							<span class="tag col_blue f_w">정상</span>
						</td>
						<td>
							<div>
								<a href="stock_info.html" class="btn small col_main f_w">상세정보</a>
							</div>
							<div>
								<a href="#none" class="btn small col_ash f_w">삭제</a>
							</div>
						</td>
					</tr>

					</tbody>
				</table>
			</div>
			<div class="page_group clearFix">
				<ul class="page_box">
					<li class="first arrow">
						<a href="#none"></a>
					</li>
					<li class="prev arrow">
						<a href="#none"></a>
					</li>
					<li class="on">
						<a href="#none">1</a>
					</li>
					<li class="">
						<a href="#none">2</a>
					</li>
					<li class="next arrow">
						<a href="#none "></a>
					</li>
					<li class="end arrow">
						<a href="#none"></a>
					</li>
				</ul>
			</div>
	</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
</body>
</html>