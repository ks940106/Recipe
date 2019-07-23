<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/import.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
	<section class="memberinsert">
	<div class="container_etc" style="width: 460px;">
		<h2>회원가입</h2>
		<form name="form_insert" id="frmInsert" method="post" action="/insertMember.do"  enctype="multipart/form-data">
			<input type="hidden" name="q_mode" value="insert"> 
				<input type="hidden" name="q_path" value="">
				
			<div id="idFrms" class="form-group has-feedback">
				<input type="text" name="id" class="form-control id" id="id" onblur="EmailCheck()" placeholder="이메일"> 
					<input type="button" id="emailcertification" onclick="emailcertification()" name="emailcertification" class="emailBtn" value="이메일 인증">
					<span id="idMsg" style="display: none;"></span>
					
					<span id="emailMsg" style="display: none;"></span>
			</div>
			<div id="pwFrms" class="form-group has-feedback">
				<input type="password" name="pw" class="form-control" id="pw" onblur="chkPasswd1()"
					 placeholder="비밀번호"> 
					<span id="pwMsg" style="display: none;"></span>
			</div>
			<div id="pwFrms2" class="form-group has-feedback mag_b_10">
				<input type="password" name="pw_check" class="form-control" id="pw_check" onblur="chkPasswd2()" placeholder="비밀번호확인">
				<span id="pwMsg2" style="display: none;" class="text-danger">비밀번호 확인을 입력해주세요.</span>
			</div>
			<div id="name" class="form-group has-feedback">
				<input type="text" name="name" class="form-control" id="name" onblur="nameck()" placeholder="이름">
			</div>
			<div id="nickFrms" class="form-group has-feedback">
				<input type="text" name="nickname" class="form-control" id="nickname" onblur="chkNick()" placeholder="닉네임"> 
				<span id="nickMsg" style="display: none;"></span>
			</div>
			
				<input type="text" name="zipCode" class="form-control zipCode" id="zipCode"placeholder="우편번호">
			
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<div id="addr1_div" class="form-group has-feedback">
				<input type="text" name="addr1" class="form-control" id="addr1" placeholder="주소">
			</div>
			<div id="addr2_div" class="form-group has-feedback">
				<input type="text" name="addr2" class="form-control" id="addr2" onblur="addrck()" placeholder="상세주소">
			</div>
			<div id="phone_div" class="form-group has-feedback">
				<input type="text" name="phone" class="form-control" id="phone" onblur="phoneck()" placeholder="핸드폰 번호 ex)010-0000-0000">
				<span id="phoneMsg" style="display: none;"></span>
			</div>
			<div class="form-group has-feedback">
				<div class="btn_gender" style="left: 20px;">
					<span class="input-group-btn">
						<input type="radio" id="genderM" name="gender" class="btn btn-sm btn-default"style="width: 100px;" onblur="genderck()" value="남">남
					</span> 
					<span class="input-group-btn">
						<input type="radio" id="genderF" name="gender" class="btn btn-sm btn-default" style="width: 100px;" onblur="genderck()" value="여">여
					</span>
				</div>
				<input type="text" class="form-control" disabled=""> 
				<span id="genderMsg" style="display: none;"></span>
			</div>
			
			<img id="image_section" src="../resources/upload/member/default_IMG.jpg" />
			<input type="file" id="fileUpload" name="fileUpload" accept=".jpg,.jpeg,.png" value="프로필 사진 선택">
			<input type="hidden" name="frm[pro_tg_gender]" id="pro_tg_gender">
			<input type="submit" class="btn btn-primary btn-block btn-lg" onclick="return doSubmit()" value="회원가입">
		</form>
	</div>
	</section>
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>

</html>