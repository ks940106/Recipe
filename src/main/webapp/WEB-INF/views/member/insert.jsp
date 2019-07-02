<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="memberinsert">
	<div class="nav_etc">
		<a href="/index.html"><img
			src="http://recipe1.ezmember.co.kr/img/logo3.png"></a>
	</div>
	<div class="container_etc" style="width: 460px;">
		<h2>회원가입</h2>
		<form name="form_insert" id="frmInsert" method="post" action="/#" autocomplete="off" onsubmit="return doSubmit()">
			<input type="hidden" name="q_mode" value="insert"> 
				<input type="hidden" name="q_path" value="">
			<div id="idFrms" class="form-group has-feedback">
				<input type="text" name="frm[pro_id_user]" class="form-control" id="id_user" onblur="chkID()" placeholder="이메일"> 
					<span id="idStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
					<span id="idMsg" style="display: none;"></span>
			</div>
			<div id="pwFrms" class="form-group has-feedback">
				<input type="password" name="frm[pro_tx_password]" class="form-control" id="tx_passwd" onblur="chkPasswd1()"
					onkeyup="chkShiftUp(event)" onkeypress="chkCapslock(event)"
					onkeydown="chkShiftDown(event)" placeholder="비밀번호"> 
					<span id="pwStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
					<span id="pwMsg" style="display: none;"></span>
			</div>
			<div id="pwFrms2" class="form-group has-feedback mag_b_10">
				<input type="password" name="tx_passwd_con" class="form-control" id="tx_passwd_con" onblur="chkPasswd2()" placeholder="비밀번호확인">
				<span id="pwStatus2" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
				<span id="pwMsg2" style="display: none;" class="text-danger">비밀번호 확인을 입력해주세요.</span>
			</div>
			<div id="nickFrms" class="form-group has-feedback">
				<input type="text" name="frm[pro_nm_user]" class="form-control" id="nm_user" onblur="chkNick()" placeholder="닉네임"> 
				<span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="nickMsg" style="display: none;"></span>
			</div>
			<div class="form-group has-feedback">
				<div class="btn_gender" style="width: 220px; left: 20px;">
					<span class="input-group-btn">
						<button type="button" id="tg_male" class="btn btn-sm btn-default"style="width: 100px;" onclick="chkGender('m')">남자</button>
					</span> 
					<span class="input-group-btn">
						<button type="button" id="tg_female" class="btn btn-sm btn-default" style="width: 100px;"
						onclick="chkGender('f')">여자</button>
					</span>
				</div>
				<input type="text" class="form-control" disabled=""> 
				<span id="genderMsg" style="display: none;"></span>
			</div>

			<input type="hidden" name="frm[pro_tg_gender]" id="pro_tg_gender">
			<button type="submit" class="btn btn-primary btn-block btn-lg">회원가입</button>
		</form>
	</div>
	</section>
</body>
</html>