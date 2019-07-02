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

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- header Fin -->
	<section>
	<div class="cp_bg"></div>
	<div class="section_content">
		<div class="cp_nav">
			<div class="cp_nav_l"><a href="/competitionList.do?competitionCheck='Y'">요리 대회</a></div>
			<div class="cp_nav_r"><a href="/competitionResultList.do"> 지난 대회 결과</a></div>
		</div>
		<div class="cp_content">
			<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
			<h1>요리 대회</h1>
			<p>싱싱레시피의 요리 대회 소식을 확인하실 수 있습니다.</p>
			<div id="cp_div_bg"></div>
			<form action="/competitionUpdate.do?competitionNo=${competition.competitionNo}" method="post">
	 <table border="1">
            <tr>
               <th colspan="2" >게시판</th>            
            </tr>
            <tr>
               <th>제목</th>
               <td><input type="text" name="competitionTitle" value="${competition.competitionTitle}"></td>
               
            </tr>          
            <tr>
               <th>내용</th>
               <td>
               <input name="competitionContents" value="${competition.competitionContents}">
              </td>
               
            </tr>
            <tr>
               <th>첨부파일</th>
               <td>
                <img src="/resources/upload/competition/${competition.competitionImg}" width="150px" height="150px;">
               </td>
               
            </tr>
         </table>
         </form>
			
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
