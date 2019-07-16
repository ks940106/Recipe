<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱캠핑 결제</title>
<link href="../resources/css/campingImport.css" rel="stylesheet" />
<link href="../resources/css/reservation.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/js/reservation.js" />
<style type="text/css">
</style>
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
                	<form action="/insertReservation.do" onsubmit="return sbm2()">
                		<input type="hidden" name="caravanNo" value="${r.caravanNo }"> 
                		<input type="hidden" name="id" value="${r.id }">
                		<input type="hidden" name="reservationPeople" value="${r.reservationPeople }">
                		<input type="hidden" name="totalCost" value="${r.totalCost}">
                		<input type="hidden" name="reservationDate" value="${r.reservationDate }">
                		<input type="hidden" name="reservationPhone">	
                		<input type="hidden" name="reservationEmail">		
                		<h1>선택 객실 목록</h1>
                		<hr>
                		<span style="width: 20%; display: inline-block; font-weight: bolder;">객실명</span>
                		<span style="width: 20%; display: inline-block; font-weight: bolder;">이용일</span>
                		<span style="width: 30%; display: inline-block; font-weight: bolder;">이용인원</span>
                		<span style="width: 20%; display: inline-block; font-weight: bolder;">총 결제 금액</span>
                		
                		<div style="width: 20%; display: inline-block; float:left;">${caravanName }</div> 
                		<div style="width: 20%; display: inline-block; float:left; color:#ea1f62;">
                		<c:forEach items="${r.reservationDateArr}" var="date">
                			${date }<br>
                		</c:forEach>
                		</div>
                		<div style="width: 30%; display: inline-block; float:left;">${r.reservationPeople }명 (기준 : ${caravanPeople }명/ 최대 : ${caravanMaxPeople }명)</div> 
                		<div style="width: 20%; display: inline-block; float:left;"><span style="color:#ea1f62; font-size:20px; font-weight: bolder;">${r.totalCost }</span>원</div>  
						<hr>
						<BR>
                		<div id="accept" style="width:48%;float: left; clear: both;">
                		<br>
                		<h2>약관동의</h2>
                		<hr>
                		<div style="background: lightgray;"><input type="checkbox" id="allChk">전체약관에 모두 동의합니다<br> (이용시 유의사항,개인정보 수집이용,개인정보 제3자제공,성인 확인)</div>
                		<br>
                		<div style="background: lightgray;"><input type="checkbox" name="accept">이용시 유의사항에 동의</div>
                		<div style="border:1px solid lightgray;">
                		1) 보호자를 동반하지 않은 <span style="color:#ea1f62;">미성년자</span>는 어떠한 경우에도 입실하실 수 없습니다.<br>
						2) 객실 내에서는 금연입니다.<br>
						3) 화재 및 냄새로 인한 타 손님 배려 차원에서 객실 내 돼지고기, 생선, 청국장의 조리를 금하오니 지정된 바비큐장을 이용하시길 부탁드립니다.<br>
						4) 오후 10시 이후의 바비큐장 이용 및 고성방가는 타 객실손님을 위하여 금하오니 양해 바랍니다.<br>
						5) 집기 파손 시에는 펜션지기에게 알려주시기 바랍니다.<br>
						6) 퇴실시 음식물을 비롯한 모든 쓰레기는 분리수거해 주시고, 사용하신 주방기구는 세척해 주시기 바랍니다.<br>
						7) 객실 정리가 끝나시면 펜션지기에게 연락하시어 퇴실점검을 받으시기 바랍니다.<br><br>
                		</div>
                		<div style="background: lightgray;"><input type="checkbox" name="accept">개인정보 수집 및 이용에 동의</div>
                		<div style="border:1px solid lightgray;">
						'(주)떠나요'는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br>
						<span style="color:#ea1f62;">수집하는 개인정보 항목</span> <br>
						회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
						1)구매(예약)자<br>
						- 수집항목 : 이름 , 로그인ID , 비밀번호 , 생년월일 , 휴대전화번호 , 이메일 , 서비스 이용기록 , 결제기록<br>
						- 개인정보 수집방법 : 홈페이지(회원가입,주문,예약)<br>
						2)숙박업주(가맹점)<br>
						- 수집항목 : 업소명 , 로그인ID , 비밀번호 , 담당자 및 신청인정보 , 연락처 , 홈페이지주소 , 사업자정보(세무신고 관련정보 일체) , 계좌정보<br>
						- 개인정보 수집방법 : 홈페이지(가맹접수 및 계약) 및 서류접수(FAX/우편) <br>
						<span style="color:#ea1f62;">개인정보의 수집 및 이용목적</span><br>
						회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
						- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>
						구매 및 요금 결제<br>
						- 회원 관리<br>
						회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리<br>
						- 예약 관리<br>
						숙박업소이용 및 사후관리에 필요한 차원의 본인확인 및 식별<br>
						- 가맹 관리<br>
						입점계약진행 및 가맹점 관리 차원<br> 
						<span style="color:#ea1f62;">개인정보의 보유 및 이용기간</span><br>
						회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.<br><br>
                		</div>
                		<div style="background: lightgray;"><input type="checkbox" name="accept">개인정보 제3자제공에 동의</div>
                 		<div style="border:1px solid lightgray;">
						<span style="color:#ea1f62;">개인정보의 제3자 제공</span><br>
						- 이용자의 경우<br>
						1) 개인정보를 제공받는 자 : 이용하고자 하는 해당 숙박업소. 새연카라반리조트<br>
						2) 제3자의 개인정보 이용 목적 : 숙박업소를 이용하는 고객의 본인확인 및 미성년자 여부를 확인하고 연락을 유지하기 위함<br>
						3) 제공하는 개인정보의 항목 : 이름, 휴대전화번호, 이메일, 생년월일, 예약정보<br>
						4) 보유기간 : 이용완료 후 5년<br><br>
                 		</div>
                		<div style="background: lightgray;"><input type="checkbox" name="accept">이용자가 미성년자가 아니며 성인임에 동의</div>
                		<div style="border:1px solid lightgray;"></div>
                		</div>
                		
                		<div style="width:48%;float: right;">
                		<br>
                		<h2>예약정보입력</h2>
                		<hr>
                		예약자명 * 
                		<input class="form-control" style="width:80%;"name="reservationName">
                		<span style="color:#ea1f62">예약자 실명을 입력하세요. 예약확인시 혼동이 될 수 있습니다.</span>
                		<br><br>
                		생년월일 * 
                		<input class="form-control" style="width:80%;"name="reservationBirth" numberOnly>
                		<span style="color:#ea1f62">예) 800722</span>
						<br><br>
                		연락처 * <br>
                		<select id="phone1" class="form-control" style="display:inline;width:24%;">
                			<option selected>010</option>
                			<option>011</option>
                			<option>016</option>
                			<option>017</option>
                			<option>018</option>
                			<option>019</option>
                		</select> &nbsp;-&nbsp; 
                		<input id="phone2" class="form-control" style="display:inline;width:24%;" maxlength="4" numberOnly> &nbsp;-&nbsp;  
                		<input id="phone3" class="form-control" style="display:inline;width:24%;" maxlength="4" numberOnly><br>
                		<span style="color:#ea1f62">예약 관련 연락을 받을 번호를 입력해주세요.</span>
                		<br><br>
                		이메일 <br>
                		<input id="email1" class="form-control" style="display:inline;width:38%;"> @ 
                		<input id="email2" class="form-control" style="display:inline;width:33%;" value="이메일을 선택해주세요." readonly>
                		<select id="email3" class="form-control" style="display:inline;width:0%;">
                			<option selected value="이메일을 선택해주세요.">--</option>
                			<option value="naver.com">naver.com</option>
                			<option value="hanmail.net">hanmail.net</option>
                			<option value="nate.com">nate.com</option>
                			<option value="gmail.com">gmail.com</option>
                			<option value="daum.net">daum.net</option>
                			<option value="hotmail.com">hotmail.com</option>
                			<option value="korea.com">korea.com</option>
                			<option value="dreamwiz.com">dreamwiz.com</option>
                			<option value="empal.com">empal.com</option>
                			<option value="lycos.co.kr">lycos.co.kr</option>
                			<option value="paran.com">paran.com</option>
                			<option value="yahoo.co.kr">yahoo.co.kr</option>
                			<option value="samsung.com">samsung.com</option>
                			<option value="icloud.com">icloud.com</option>
                			<option value="1">직접입력</option>
                		</select><br><br>
                		요청사항 <br>
                		<textarea class="form-control" style="display:inline;width:80%;" name="reservationRequest"></textarea><br><br>
                		
                		<button class="btn btn-primary" type="button" onclick="location.href='/peopleSelect.do?caravanNo=${r.caravanNo}&reservationDateString=${r.reservationDate}'">이전으로</button>
                		<input class="btn btn-success" type="submit" value="결제하기">
                		</div>
               		</form>
                </div>
            </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"/>
<script>
	$("#allChk").change(function(){
		if($(this).is(":checked")){
			$("input[name=accept]").prop("checked",true);
		}else{
			$("input[name=accept]").prop("checked",false);
		}
	});
	$("#email3").change(function(){
		if($(this).val()==1){
			$("#email2").val("");
			$("#email2").attr("readonly",false);
			return;
		}
		$("#email2").val($(this).val());
		$("#email2").attr("readonly",true);
	});
	function sbm2(){
		var chk = new Array();
		for(var i = 0; i<4;i++){
			chk[i] = $("input[name=accept]").eq(i).is(":checked");
		}
		for(var i = 0; i<4;i++){
			if(chk[i]==false){
				alert("이용약관에 동의해주세요.");
				return false;
			}
		}
		var phone = $("[name=reservationPhone]").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
		var email = $("[name=reservationEmail]").val($("#email1").val()+"@"+$("#email2").val());
		var name = $("[name=reservationName]").val();
		var nameExp = /^[가-힣]+$/;
		if(!nameExp.test(name)){
			alert("예약자명을 확인하세요.");
			return false;
		}
		var birth = $("[name=reservationBirth]").val();
		var birthExp = /^[0-9]{6}$/;
		if(!birthExp.test(birth)){
			alert("생년월일은 6자로 입력 하여야 합니다.");
			return false;
		}
		if($("#phone2").val()=="" ||$("#phone3").val()==""){
			alert("연락처를 확인하세요.");
			return false;
		}
		return true;
	}
	
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
</script>
</body>
</html>