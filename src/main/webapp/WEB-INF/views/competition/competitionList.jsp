<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>싱싱레시피 요리대회</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head> 

<body>

	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
	<!-- header Fin -->
	<section>
	<div class="pom_bg">
        <div class="pom_top">
            <h1>요리대회</h1>
            <div class="pom_div_bg"></div>
            <p>자연속에서 즐기는 요리대회</p>
        </div>
    </div>
        <div class="pom_wrap">
            <div class="pomNav">
                <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
            </div>
            <div class="section_content">
                <!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
			<div class="cp_content">
				<div class="cp_content">
					<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
					<!--<h1>요리 대회</h1>
			<p>싱싱레시피의 요리 대회 소식을 확인하실 수 있습니다.</p>-->
					<!--			<div id="cp_div_bg"></div>-->
					<div class="cp_notice">
						<div id="cp_title">${competition.competitionTitle}</div>
						<div id="cp_div_bg"></div>
						<div id="cp_date">${competition.competitionDate}</div>
						<div class="cp_contentsView">
							<div id="cp_contentsImg">
								<c:if test="${not empty competition.competitionImg}">
									<img src="../../../resources/upload/competition/${competition.competitionImg}" width="800px;">
								</c:if>
							</div>
							<div id="cp_contents">${competition.competitionContents}</div>
						</div>
						<c:if test="${sessionScope.member != null }">
							<c:if test="${participant == null }">
						<div class="cp_participant">
				            <h1>요리대회 신청하기</h1>
				            <div class="pom_div_bg"></div>
				        </div>
						<form action="/participantInsert.do" method="post" onsubmit="return check()">
						<div class="cp_form">
							<table class="cp_table">
							<input type="hidden" name="competitionNo" value="${competition.competitionNo}">
								<tr>
									<td>
										아이디 <br> <input type="text" name="id" value="${sessionScope.member.id}" readonly> 
									</td>
								</tr>
								<tr>
									<td>
										이름 <br> <input type="text" value="${sessionScope.member.name}" readonly> 
									</td>
								</tr>
								<tr>
									<td>
										전화번호 <br> <input type="text" value="${sessionScope.member.phone}" readonly> 
									</td>
								</tr>
								<tr>
									<td>
										성별 <br> <input type="text" value="${sessionScope.member.gender}" readonly> 
									</td>
								</tr>
								<tr>
									<td>
										신청이유 <br> <textarea rows="10" cols="85" name="participantContent" id="pContent"></textarea> 
									</td>
								</tr>
							</table>
							</div>
							<input type="submit" value="대회참가 신청하기" >
                            <!-- <div id="cp_btn">
								<input type="submit" value="대회참가 신청하기">
				            </div> -->
						</form>
							</c:if>
							<c:if test="${participant != null}">
								<button type="button">이미 참가한 대회</button>
							</c:if>
						</c:if>
					</div>
					
					<!--
			 <button onclick="location.href='/competitionUpdate.do?competitionNo=${competition.competitionNo}'">수정하기</button>   
          <button  onclick="location.href='/competitionDelete.do?competitionNo=${competition.competitionNo}'" >삭제하기</button>
-->
				</div>
			</div>
		</div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
	<script>
	  function check(){
		 var con =  $("#pContent").val();
		 alert(con);
		 var exp = /^.{20,500}$/;
		 con = con.replace(/</g,"&lt;");
		 con = con.replace(/>/g,"&gt;");
		 con = con.replace(/\"/g,"&quot;");
		 con = con.replace(/\'/g,"&#39;");
		 con = con.replace(/\n/g,"<br />");
		 return con;
		 alert(con);
		 if(!exp.test(con)){
			 alert("사연을 20자~500자 사이로 적어주세요");
			 return false;
		 }else{
			 return true;
		 }    
	  }
	</script> 
</body>

</html>
