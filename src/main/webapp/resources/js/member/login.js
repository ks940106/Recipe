




function loginProc() {


	var id	=	$('#userID');
	var pw	=	$('#userPW');


	if(id.val() == ""){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}


	if(pw.val() == ""){
		alert("비밀번호를 입력해주세요.");
		pw.focus();
		return false;
	}


	console.log($('#frm').serialize())



	$.ajax({
		url : "/loginProc",
		data : $('#frm').serialize(),
		dataType : "html",
		success:function (data) {

			console.log(data);

			if(data.trim() == "Y"){

				location.href="/home";

			}else{
				alert("아이디 및 비밀번호를 확인해주세요.")
			}

		},
		error:function () {

			alert("에러 발생");
		}
	})


}