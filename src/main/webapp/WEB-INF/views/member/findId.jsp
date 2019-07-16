<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
<section class="findPassword">
	<h1>비밀번호 변경</h1>
	<form method="post" action="/findId.do">
	<div class="find">
	<p>아이디 찾기</p>
	<p>아이디 찾기를 위해 이름과 전화번호를 입력해주세요</p>
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" placeholder="010-0000-0000"></td>
		</table>
	</div>
	<button type="submit">아이디 찾기</button>
	</form>
</section>
</body>
</html>