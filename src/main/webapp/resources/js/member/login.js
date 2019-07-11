




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
//쿠키로 아이디 저장
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("#id_user").val(userInputId); 
     
    if($("#id_user").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#id_save").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#id_save").change(function(){ // 체크박스에 변화가 있다면,
        if($("#id_save").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#id_user").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id_user").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#id_save").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#id_user").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}