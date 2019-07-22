<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>싱싱레시피 요리대회</title>
<style type="text/css">
	.section_content1{
	width:1000px;
	min-height: 100vh;
    margin: 0 auto;
	}
</style>
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

	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
	<!-- header Fin -->
	<section>
	<div class="pom_bg">
        <div class="pom_top">
        </div>
    </div>
        <div class="pom_wrap">
            <div class="pomNav">
               <nav class="nav_wrap">
					<div class="nav_con">
						<div class="nav_title">요리대회</div>
						<ul class="nav_menu">
							<c:choose>
     					<c:when test="${empty sessionScope.member }">
     						<li><a href="/competitionList.do?competitionCheck='Y'&id='null'">진행중인대회</a></li>
     					</c:when>
     					<c:otherwise>
     						<li><a href="/competitionList.do?competitionCheck='Y'&id=${sessionScope.member.id}">진행중인대회</a></li>
     					</c:otherwise>
     				</c:choose>
				            <li>
				                <a href="/competitionResultList.do">지난 대회 보기</a><span>></span>
				            </li>
						</ul>
					</div>
				</nav>
            </div>
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
								<c:if test="${not empty competition.competitionImg  }">
									<img
										src="../../../resources/upload/competition/${competition.competitionImg}"
										width="800px;">
								</c:if>
							</div>
							<div id="cp_contents">${competition.competitionContents}</div>
						</div>
					</div>
					<div id="cp_btn">							
						<button onclick="location.href='/competitionAdminResultList.do'">목록으로 가기</button>
					</div>
					<!--
			 <button onclick="location.href='/competitionUpdate.do?competitionNo=${competition.competitionNo}'">수정하기</button>   
          <button  onclick="location.href='/competitionDelete.do?competitionNo=${competition.competitionNo}'" >삭제하기</button>
-->
				</div>
			</div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>

</html>
