
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
function readURL(input) {
	 
    if (input.files && input.files[0]) {
        var reader = new FileReader();
 
        reader.onload = function (e) {
            $('#image_section').attr('src', e.target.result);
        }
 
        reader.readAsDataURL(input.files[0]);
    }
}
 
$("#fileUpload").change(function(){
    readURL(this);
});

function reg()   {
	         var memberPw=$("#new_pw").val();
	         var memberPwRe=/^[A-Za-z0-9!@#$%^&*()_+=.,/]{6,12}$/;
	         var memberPwcheck=$("#pwck").val();
	         var addr1=$("#addr1").val();
	     	var addr2=$("#addr2").val();
	     	var zipCode=$("#zipCode").val();
	     	var phone = $("#phone").val();
    		var phonech=/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
    		 console.log(addr2.length)
    		 if($("#new_pw").val()=="" && $("#pwck").val()==""){
    			$("#new_pw").val($("[name=orgin_pw]").val());
    			$("[name=bool]").val("false"); //안바꿨단소리
    		 }else{
    			 $("[name=bool").val("true");
    			 if(!memberPwRe.test(memberPw)){
    	        	 alert("패스워드는 영어,숫자,특수문자 포함 6~12글자 입니다");
    	        	 return false;
    	         }
    	         if(memberPw != memberPwcheck){
    	      		alert("비밀번호와 비밀번호 확인이 다릅니다");
    	      		return false;
    	      	} 
    		 }
	         if(!phonech.test(phone)){
		    		alert("핸드폰번호를 입력해주세요");
		    		return false;
		    }
	        
	     	if(zipCode==''){
	     		alert("주소를 입력해주세요");
	     		return false;
	     		}
	    	if(addr1==''){
	    		alert("주소를 입력해주세요");
 				return false;
	     	}
	    	if(addr2==''){
	    		alert("주소를 입력해주세요");
 				return false;
	    	}
	     	
};