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
<section class="findPw">
	<h1>비밀번호 변경</h1>
	<form method="post" action="/findPassword.do">
	<div class="find">
	<p>임시 비밀번호 발급을 위해 아이디와 이름을 입력해주세요</p>
	<p>임시 비밀번호는 이메일로 전송됩니다</p>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" ></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
		</table>
	</div>
	<button type="submit">임시 비밀번호 발급 받기</button>
	</form>
</section>
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>
</html>