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
table{table-layout: fixed;}
</style>
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
									<span style="color:#1f6054;font-weight: bold; font-size: 12pt;"> * '예약 번호'를 클릭하면 예약 상세 보기가 가능합니다.</span>
									<br><br><br>
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
										<td><a href="/reservationView.do?reservationId=${vo1.reservationId }">${vo1.reservationId }</a></td>
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
										<td><a href="/reservationView.do?reservationId=${vo2.reservationId }">${vo2.reservationId }</a></td>
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
										<td><a href="/reservationView.do?reservationId=${vo3.reservationId }">${vo3.reservationId }</a></td>
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
										<td><a href="/reservationView.do?reservationId=${vo4.reservationId }">${vo4.reservationId }</a></td>
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
<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
	<script>
	maxDataCount = [0,"${count1}","${count2}","${count3}","${count4}"]; //각각의 자료 갯수 //28/15/24/33
	maxPageCount = [0,"${page1}","${page2}","${page3}","${page4}"]; //각각 페이지 개수 //6/3/5/7
	pageState = [0,1,1,1,1]; //현재 페이지5개뭉터기의 페이지 수
	maxPageState = [0,1,1,1,1]; //최대 페이지5개뭉터기 페이지 수
		window.onload=function(){
			for(var i = 1 ; i<5;i++){
				if(maxPageCount[i]>5){ //페이지 개수가 5개 이상이면 다음버튼을 활성화
					$("#next"+i).css("display","inline");
				}
			}
			for(var i = 1; i<5;i++){
				if(maxPageCount[i]%5==0){ //페이지뭉터기의 페이지 수 결정
					maxPageState[i]=maxPageCount[i]/5; 
				}else{
					maxPageState[i]=Math.floor(maxPageState[i]/5)+1;
				}
			}
			paging(1,1); //첫번째 자료리스트를 첫번째페이지로 선택
			paging(2,1);
			paging(3,1);
			paging(4,1);
		}
		function paging(listNum,num){
			$("#payment"+listNum+" tr:not(:last-child)").css("display","none"); //a태그 들어가는 tr 빼고 다 일단 안보이게
			$("#payment"+listNum+" a").css("color","black"); //페이지a태그 까맣게
			for(var i = 5*(num-1)+1; i<5*(num-1)+6; i++){
				$("#list"+listNum+"tr"+i).css("display","table-row"); //자료들을 페이지에 맞게 보여줌
			}
			$("#list"+listNum+"a"+num).css("color","red"); //현재 페이지 색 빨갛게
		}
		function next(listNum){ //다음버튼 클릭 시 어떤 자료인지를 알려줌
			pageState[listNum]=pageState[listNum]+1; //페이지뭉터기의 다음페이지로
			if(pageState[listNum]>1){ //현재 페이지뭉터기페이지가 1이상 되면 이전버튼활성화 
				$("#prev"+listNum).css("display","inline");
			}
			if(pageState[listNum]==maxPageState[listNum]){ //최대 페이지뭉터기페이지와 현재페이지뭉터기페이지 수가 같으면 다음버튼비활성화
				$("#next"+listNum).css("display","none");
			}
			$(".listpage"+listNum).css("display","none"); //기존 모든 a태그페이지 없애고
			for(var i = 5*(pageState[listNum]-1)+1; i<5*(pageState[listNum]-1)+6; i++){ //필요한 a태그페이지만 보여줌
					$("#list"+(listNum)+"a"+i).css("display","inline");
			}
			paging(listNum,5*(pageState[listNum]-1)+1); //자동으로 그 다음 첫번째 페이지 선택효과
		}
		function prev(listNum){
			pageState[listNum]=pageState[listNum]-1; //현재페이지뭉터기 페이지를 한단계 낮춤
			$("#next"+listNum).css("display","inline"); //이전버튼이 존재하여 눌렀다면 다음버튼도 당연히 존재하는 것이므로 활성화
			if(pageState[listNum]==1){ //현재 페이지뭉터기페이지가 1이면 이전이 없으므로 이전버튼비활성화
				$("#prev"+listNum).css("display","none");
			}
			$(".listpage"+listNum).css("display","none"); //기존 모든 a태그페이지 없애고
			for(var i = 5*(pageState[listNum])-4; i<5*(pageState[listNum])+1; i++){ //필요한 a태그페이지만 보여줌
				$("#list"+(listNum)+"a"+i).css("display","inline");
			}
			paging(listNum,5*(pageState[listNum])); //자동으로 이전 마지막페이지 선택효과
		}
		
		function reservationUpdate(what){
			var reservationId = new Array();
			var count = 0;
			if(what=="approve" || what=="cancel"){
				$("input[name=reservationId1]:checked").each(function() {
					reservationId[count] = $(this).val();
					count++;
				});
			}else{
				$("input[name=reservationId2]:checked").each(function() {
					reservationId[count] = $(this).val();
					count++;
				});
			}
			
			if(what =="approve"){
				location.href="/reservationUpdate.do?reservationId="+reservationId+"&reservationState=2";
			}else{
				location.href="/reservationUpdate.do?reservationId="+reservationId+"&reservationState=4";
			}
			
			
		}
	</script>
</body>
</html>