<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	
	<form action="insertTalkBoard.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardType" value="요리톡">
		<input type="hidden" name="nickname" value="투명인간">
		<textarea rows="30" cols="150" name="boardContents"></textarea>
		<br>
		<input type="file" name="fileTest" multiple><br>
   		<br><br>
		<input type="submit" value="등록">
	</form>
	
	
</body>
</html>