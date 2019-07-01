<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h1>토크보드</h1>
	<br>
	<br>
	<a href="/newTalkBoard.do">글쓰기</a>
	<br>
	<br>
	<table>
		<tr>
			<th>번호</th>
			<th>타입</th>
			<th>닉네임</th>
			<th>이미지</th>
			<th>내용</th>
		</tr>
		<c:forEach items="${list}" var="t">
		<tr>
			<td>${t.boardNo }</td>
			<td>${t.boardType }</td>
			<td>${t.nickname }</td>
			<td>${t.boardImg }</td>
			<td>${t.boardContents }</td>
		</tr>
		</c:forEach>
	</table>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>