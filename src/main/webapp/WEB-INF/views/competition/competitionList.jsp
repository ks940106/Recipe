<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>싱싱레시피 요리대회</title>
    <link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>

  		 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  		<!-- header Fin -->
  		<div>
  				<h1>게시판 입니다</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${list }" var="c">
		<tr>
			<td>${c.competitionNo}</td>
			<td><a href="competitionView.do?competitionNo=${c.getcompetitionNo}">${c.competitionTitle }</td>
			<td>${c.competitionDate }</td>
		</tr>
		</c:forEach>
	</table>
	<div>
	<a href="/competitionWrite.do">
		글쓰기
	</a>
	</div>
  		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>