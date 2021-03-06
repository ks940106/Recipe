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
	<section class="login">
	<div class="container_etc" style="width:460px;">
  <h2>로그인</h2>
  <div class="panel-body">
    <form name="form_login" id="formLogin" method="post" action="/login.do" autocomplete="off" onsubmit="return doSubmit()">
      <div class="form-group">
        <input type="text" name="id" class="form-control" id="userId" placeholder="아이디">
        <span id="idMsg" style="display:none;color:#FF0000;">아이디를 입력해주세요.</span>
      </div>
      <div class="form-group">
        <input type="password" name="pw" class="form-control" id="passwd" placeholder="비밀번호">
        <span id="pwMsg" style="display:none;color:#FF0000;">비밀번호를 입력해주세요.</span>
      </div>
      <button type="submit" class="btn-primary btn-lg btn-block login">로그인</button>
      <div class="checkbox">
        <label>
          <input type="checkbox" name="idSaveCheck" id="idSaveCheck" value="1"><span class="id_save">아이디 저장</span>
        </label>
      </div>
    </form>
    <p class="help-block">개인정보 보호를 위해 개인 PC에서만 사용하세요.</p>
    <div class="etc_line"></div>
    <div class="join_btn">
        <a href="/joinPage.do">회원가입</a>
        <a href="/findIdPage.do">아이디 찾기</a>
        <a href="/findPasswordPage.do">비밀번호 찾기</a>
    </div>
      </div>
	</div>
	</section>
	
	<script type="text/javascript" src="/resources/js/member/login.js"></script>
</body>
</html>