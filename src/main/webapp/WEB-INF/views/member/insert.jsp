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
		<a href="/index.jsp"><img
			src="http://recipe1.ezmember.co.kr/img/logo3.png"></a>
	</div>
	<div class="container_etc" style="width: 460px;">
		<h2>회원가입</h2>
		<form name="form_insert" id="frmInsert" method="post" action="/insertMember.do" onsubmit="return doSubmit()" enctype="multipart/form-data">
			<input type="hidden" name="q_mode" value="insert"> 
				<input type="hidden" name="q_path" value="">
				
			<div id="idFrms" class="form-group has-feedback">
				<input type="text" name="id" class="form-control" id="id" onblur="EmailCheck()" placeholder="이메일"> 
					<span id="idMsg" style="display: none;"></span>
					<input type="button" id="emailcertification" onclick="emailcertification()" name="emailcertification" class="emailBtn" value="이메일 인증">
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
				<input type="text" name="name" class="form-control" id="name"placeholder="이름">
			</div>
			<div id="nickFrms" class="form-group has-feedback">
				<input type="text" name="nickname" class="form-control" id="nickname" onblur="chkNick()" placeholder="닉네임"> 
				<span id="nickMsg" style="display: none;"></span>
			</div>
			<div id="zip_code" class="form-group has-feedback">
				<input type="text" name="zipCode" class="form-control" id="zipCode"placeholder="우편번호">
			</div>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<div id="addr1_div" class="form-group has-feedback">
				<input type="text" name="addr1" class="form-control" id="addr1" placeholder="주소">
			</div>
			<div id="addr2_div" class="form-group has-feedback">
				<input type="text" name="addr2" class="form-control" id="addr2" placeholder="상세주소">
			</div>
			<div id="phone_div" class="form-group has-feedback">
				<input type="text" name="phone" class="form-control" id="phone" onblur="phoneck()" placeholder="핸드폰 번호 ex)010-0000-0000">
				<span id="phoneMsg" style="display: none;"></span>
			</div>
			<div class="form-group has-feedback">
				<div class="btn_gender" style="width: 220px; left: 20px;">
					<span class="input-group-btn">
						<input type="radio" id="genderM" name="gender" class="btn btn-sm btn-default"style="width: 100px;" onclick="chkGenderM()" value="남">남자</button>
					</span> 
					<span class="input-group-btn">
						<input type="radio" id="genderF" name="gender" class="btn btn-sm btn-default" style="width: 100px;" onclick="chkGenderF()" value="여">여자</button>
					</span>
				</div>
				<input type="text" class="form-control" disabled=""> 
				<span id="genderMsg" style="display: none;"></span>
			</div>
			<input type="file" id="fileUpload" name="fileUpload" accept=".jpg,.jpeg,.png">
			<input type="hidden" name="frm[pro_tg_gender]" id="pro_tg_gender">
			<button type="submit" class="btn btn-primary btn-block btn-lg">회원가입</button>
		</form>
	</div>
	</section>
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	$("#emailcertification").prop("disabled",true);
})
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
            document.getElementById('zipCode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}
//아이디 확인
function EmailCheck(){
	EmailCheckFlag=false;
	var email=$("#id").val();
	var emailchk=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (!emailchk.test(email)) {//이메일 형식 오류
		$("#idMsg").html("이메일 주소가 올바르지 않습니다");
		$("#idMsg").css("display", "block");
		$("#emailcertification").prop("disabled",true);
		return;
	}
	if (emailchk.test(email)) {
		$.ajax({
			type:"post",
			url:"/emailCheck.do",
			data:{email:email},
			success : function(data) {
				console.log(data.trim())
					if (data.trim() == "Y") {//이메일 중복 없음
						$("#idMsg").html("사용가능한 이메일 입니다");
						$("#idMsg").css("display", "block");
						$("#emailcertification").prop("disabled",false);
						EmailCheckFlag=true;
					}else{
						$("#idMsg").html("중복된 이메일입니다");
						$("#idMsg").css("display", "block");
						$("#emailcertification").prop("disabled",true);
						return;
					}
				},
				error : function () {
	            alert("에러 발생")
	         	}
			})
		}
	}
	//핸드폰 정규식
	function phoneck(){
		var phone = $("#phone");
		var phonech=/^\d{3}-\d{3,4}-\d{4}$/;
		console.log(phonech);
		if(!phonech.test(phone)){
			$("#phoneMsg").html("핸드폰 형식을 맞춰주세요");
			$("#phoneMsg").css("display","block");
			return;
		}
	}
	//이메일 인증
	$("#emailcertification").click(function(){
		emailcertification=false;
		var email = $("#id").val();
		console.log(email);
		var url="/emailcertification.do";
		var pop=window.open("emailcertification.jsp","emailcertification","width=400,height=300");
		pop.location.href=url+"?email="+email;
		console.log(emailcertification);
	})
	
	//비밀번호 정규식
	function chkPasswd1() {
		var pw = $("#pw").val();
		var pwchk = /^[A-Za-z0-9!@#$%^&*()_+=.,/]{6,12}$/;
		console.log(pwchk)
		pwchkFlag=false;
		console.log(pwchkFlag);
		if (pwchk.test(pw)) {
			$("#pwMsg").html("사용 가능한 패스워드 입니다");
			$("#pwMsg").css("display", "block");
			pwchkFlag=true;
		}
		if (!pwchk.test(pw)) {
			$("#pwMsg").html("패스워드는 영어,숫자,특수문자 포함 6~12글자 입니다");
			$("#pwMsg").css("display", "block");
			return;
		}
		if(!pw){
			return;
		}
	}
	//비밀번호확인
	function chkPasswd2() {
		var pw = $("#pw").val();
		var pw_check = $("#pw_check").val();
		pw2ck=false;
		console.log(pw_check);
		if (pw_check == pw) {
			$("#pwMsg2").css("display", "none");
			pw2ck=true;
		}
		if (pw_check != pw) {
			$("#pwMsg2").html("패스워드와 패스워드 확인이 다릅니다");
			$("#pwMsg2").css("display", "block");
			return;
		}
	}
	//닉네임 중복체크
	function chkNick(){
		nicknameFlag=false;
		var nickname =$("#nickname").val();
		var nicknameCheck="";
		if(!nickname){
			$("#nickMsg").html("닉네임을 입력해주세요");
			$("#nickMsg").css("display","block");
			return;
		}
		
		if(nickname){
			console.log(nickname);
			$.ajax({
				type:"post",
				url:"/nickCheck.do",
				data:{nickname:nickname},
				success:function(data){
					if(data.trim()=="Y"){//중복 없음
						$("#nickMsg").html("사용가능한 닉네임 입니다");
						$("#nickMsg").css("display","block");
						nicknameFlag=true;
					}else{
						$("#nickMsg").html("사용불가능한 닉네임 입니다");
						$("#nickMsg").css("display","block");
						return;
					}
				},
				error :function(){
					console.log("에러발생")
				}
			})
		}
	}
	
	function doSubmit(){
		console.log(EmaiEmailCheckFlag);
		if(!EmaiEmailCheckFlag){
			EmailCheck();
			return false;
		}
		
		if(!chkNickFlag){
			chkNick();
			return false;
		}
		if(!chkPasswd2){
			chkPasswd2();
			return false;
		}
		if(!pwchkFlag){
			chkPasswd1();
			return false;
		}
		if(phoneck){
			phoneck();
			return false;
		}
		
	}
 	
 	
</script>
</html>