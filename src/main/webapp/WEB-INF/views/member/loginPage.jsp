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
        <a href="/findPassword.do">비밀번호 찾기</a>
    </div>
    <button type="button" onclick="location.href='https://www.10000recipe.com/user/login_fb.html?q_path=' +encodeURIComponent('') " class="btn btn-primary btn-lg btn-block join_f"><span>페이스북으로 로그인</span></button>
    <button type="button" onclick="loginWithKakao()" class="btn btn-primary btn-lg btn-block join_k"><span>카카오톡으로 로그인</span></button>
    <button type="button" onclick="loginWithNaver()" class="btn btn-primary btn-lg btn-block join_n"><span>네이버로 로그인</span></button>
        <button type="button" onclick="loginWithGoogle()" class="btn btn-primary btn-lg btn-block join_g" id="gooleSigninButton"><span>구글로 로그인</span></button>
          </div>
	</div>
	</section>
	
	<script type="text/javascript" src="/resources/js/member/login.js"></script>
</body>
</html>