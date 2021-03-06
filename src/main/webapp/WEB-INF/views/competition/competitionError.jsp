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
        </div>
    </div>
        <div class="pom_wrap">
            <div class="pomNav">
               <nav class="nav_wrap">
					<div class="nav_con">
						<div class="nav_title">요리대회</div>
						<ul class="nav_menu">
							<li>
				                <a href="/competitionList.do">진행중인 대회</a><span>></span>
				            </li>
				            <li>
				                <a href="/competitionResultList.do">지난 대회 보기</a><span>></span>
				            </li>
						</ul>
					</div>
				</nav>
            </div>
            <div class="section_content">
               <h1 style="font-size: 22px; text-align: center;">진행중인 대회가 없습니다.</h1>			
		</div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />

</body>

</html>
