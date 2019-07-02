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
			<div id="zip code" class="form-group has-feedback">
				<input type="text" name="zipcode" class="form-control" id="zipcode"placeholder="우편번호">
			</div>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<div id="addr1_div" class="form-group has-feedback">
				<input type="text" name="addr1" class="form-control" id="addr1" placeholder="주소">
			</div>
			<div id="addr2_div" class="form-group has-feedback">
				<input type="text" name="addr2" class="form-control" id="addr2" placeholder="상세주소">
			</div>
			<div id="phone" class="form-group has-feedback">
				<input type="text" name="phone" class="form-control" id="phone" placeholder="핸드폰 번호">
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}

</script>
</html>