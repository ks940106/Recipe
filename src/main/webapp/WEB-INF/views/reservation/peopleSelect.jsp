<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱캠핑 인원선택</title>
<link href="../resources/css/campingImport.css" rel="stylesheet" />
<link href="../resources/css/reservation.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/js/reservation.js" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"/>
<section>
	<div class="pom_bg">
        <div class="pom_top">
            <h1>예약</h1>
            <div id="pom_div_bg"></div>
            <p>카라반 예약하기</p>
        </div>
    </div>
    <div class="pom_wrap">
            <div class="pomNav">
                <jsp:include page="/WEB-INF/views/tmr/tmrNav.jsp"/>
            </div>
            <div class="section_content_nav">
                <div class="cp_content">
                	<form action="/paymentPage.do" onsubmit="return sbm()">
                	<input type="hidden" name="reservationDate" value="${reservationDateString }">
                	<input type="hidden" name="caravanNo" value="${c.caravanNo }"> 
                	<input type="hidden" name="totalCost">
                	<input type="hidden" name="reservationPeople">
                	<input type="hidden" name="id" value="${sessionScope.member.id }">
                	<input type="hidden" name="caravanName" value="${c.caravanName }">
                	<input type="hidden" name="caravanPeople" value="${c.caravanPeople }">
                	<input type="hidden" name="caravanMaxPeople" value="${c.caravanMaxPeople }">
               		<h1>인원을 선택하여 주십시오</h1>
               		${c.caravanName } ${c.caravanArea }평 기준${c.caravanPeople }명/최대${c.caravanMaxPeople }명<br>
               		<button id="down" type="button" class="btn btn-primary">▽</button> 
               		<span id="people">${c.caravanPeople }</span>명
               		<button id="up" type="button" class="btn btn-primary">△</button>
               		, 1인 당 추가금액 : ${c.caravanPlusCost }원 (1박 당)
            		<br>
            		<span id="date"></span> <span id="price" name="totalCost"></span>원
            		<br>
            		<input type="submit" class="btn btn-success" value="예약 상세 정보 입력">
               		</form>
                </div>
            </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"/>
<script>
window.onload=function(){
	dateCount = $("[name=reservationDate]").val().split(',').length;
	$("#date").text(dateCount+"박"+Number(dateCount+1)+"일");
	$("#price").text(dateCount * ${c.caravanCost});
}
$("#down").click(function(){
	if($("#people").text()-1==0){
		alert("1명 이상 선택하여야 합니다.");
		return;
	}
	$("#people").text($("#people").text()-1);
	chkPrice();
});
$("#up").click(function(){
	if(Number($("#people").text())+1>${c.caravanMaxPeople}){
		alert("최대인원 이상 선택할 수 없습니다.");
		return;
	}
	$("#people").text(Number($("#people").text())+1);
	chkPrice();
});
function chkPrice(){
	var stdPeople = ${c.caravanPeople};
	var maxPeople = ${c.caravanMaxPeople};
	var rsvPeople = $("#people").text();
	if(rsvPeople>stdPeople){
		$("#price").text(Number(dateCount*${c.caravanCost})+Number(dateCount*${c.caravanPlusCost}*(rsvPeople-stdPeople)));
	}else{
		$("#price").text(dateCount*${c.caravanCost});
	}
	
}
function sbm(){
	$("[name=totalCost]").val($("#price").text());
	$("[name=reservationPeople]").val($("#people").text());
	return true;
}
</script>
</body>
</html>