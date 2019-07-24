<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱캠핑 예약</title>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/campingImport.css" rel="stylesheet" />
<link href="../resources/css/reservation.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/js/reservation.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"/>
<div class="ab_cover"></div>
<section>
    <div class="pom_wrap">
            <div class="pomNav">
                <nav class="nav_wrap">
				<div class="nav_con">
					<div class="nav_title">카라반 예약</div>
				</div>
			</nav>
            </div>
            <div class="section_content_nav">
                <div class="cp_content">
                </div>
            </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"/>
<script>
 	var uid = "${caravanName}";
 	var caravanNo = ${r.caravanNo};
 	var id = "${r.id}";
 	var reservationPeople = ${r.reservationPeople};
 	var totalCost = ${r.totalCost};
 	var reservationDate = "${r.reservationDate}";
 	var reservationName = "${r.reservationName}";
 	var reservationBirth = "${r.reservationBirth}";
 	var reservationPhone = "${r.reservationPhone}";
 	var reservationEmail = "${r.reservationEmail}";
 	var reservationRequest = "${r.reservationRequest}";
 	var caravanName = "${caravanName}";
	window.onload=function(){
		var d= new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds(); //컴퓨터는 0월부터 시작이므로 +1 해준것임
		uid = uid+"_"+date;
		IMP.init('imp01173439');
		IMP.request_pay({
			merchant_uid : uid,
			name : "싱싱캠핑_예약",				
			amount : totalCost ,
			buyer_email : reservationEmail,
			buyer_name : reservationName,
			buyer_tel : reservationPhone,
		},function(rsp){
			if(rsp.success){
				alert("결제가 완료되었습니다.");
				location.href="/insertReservation.do?reservationId="+uid+"&caravanNo="+caravanNo+"&id="+id+"&reservationPeople="+reservationPeople+"&totalCost="+totalCost+"&reservationDate="+reservationDate+"&reservationName="+reservationName+"&reservationBirth="+reservationBirth+"&reservationPhone="+reservationPhone+"&reservationEmail="+reservationEmail+"&reservationRequest="+reservationRequest+"&caravanName="+caravanName;
				//location.href="/failReservation.do?error="+rsp.error_msg;
			}else{
				alert("결제가 실패하였습니다.");
				//location.href="/insertReservation.do?reservationId="+uid+"&caravanNo="+caravanNo+"&id="+id+"&reservationPeople="+reservationPeople+"&totalCost="+totalCost+"&reservationDate="+reservationDate+"&reservationName="+reservationName+"&reservationBirth="+reservationBirth+"&reservationPhone="+reservationPhone+"&reservationEmail="+reservationEmail+"&reservationRequest="+reservationRequest+"&caravanName="+caravanName;
				location.href="/failReservation.do?error="+rsp.error_msg;
			}
		});
	}
</script>
</body>
</html>