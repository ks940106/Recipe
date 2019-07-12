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
            <div class="section_content_nav">
                <!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
                <div class="cp_content">
					
                </div>
            </div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>

</html>
