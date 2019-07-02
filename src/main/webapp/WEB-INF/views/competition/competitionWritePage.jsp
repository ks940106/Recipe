<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>싱싱레시피 요리대회 등록</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- header Fin -->
	<section>
	<div class="cp_bg"></div>
	<div class="section_content">
		<form action="/competitionWritePage.do" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="competitionTitle"><br>
		내용 : <textarea rows="20" cols="10" name="competitionContents"></textarea><br>
		파일 업로드 : <input type="file" name="fileUpload"><br>
		대회진행여부 : <input type="checkbox" value="Y" name="competitionCheck">진행중 <br>
				<input type="checkbox" value="N" name="competitionCheck">진행완료
		<input type="submit" value="완료"><br>
	</form>
<%--             <button onclick="competitionUpload('${competition.competitionNo}')">수정하기</button>    --%>
<%--           <button  onclick="competitionDelete('${competition.competitionNo}')">삭제하기</button> --%>
         
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>