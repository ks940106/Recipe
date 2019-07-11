/**
 * 
 */

function payment(id,name,phone,zipCode,addr1,addr2) {
				var recipeCount = $("[name='recipeCount']");
				var noarray1 = new Array();
				for(var i=0;i<recipeCount.length;i++){
					noarray1[i] = recipeCount.eq(i).val();
				}
				var recipeNo = $("[name='recipeNo']");
				var noarray = new Array();
				for(var i=0;i<recipeNo.length;i++){
					noarray[i] = recipeNo.eq(i).val();
				}
				var price = $("#countSpan").html();
				var d = new Date();
				var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
				IMP.init('imp40592834');
				IMP.request_pay({
				 merchant_uid : date,	//거래ID
				 name : "싱싱레시피",				//결제명
				 amount : price,				//결제금액
				 buyer_email : id,	//구매자 email
				 buyer_name	: name,					//구매자 이름
				 buyer_tel	: phone,
				 buyer_addr : addr1+addr2,
				 buyer_postcode : '123-456'				//우편번호
				},function(rsp){
					if(rsp.success){
						var msg = '결제가 완료되었습니다.';
						var info1 = '고유 ID :' + rsp.imp_uid;
						var info2 = '결제 금액 :' + rsp.paid_amount;
						var info3 = '카드 승인 번호 :' + rsp.apply_num;
						$("#paymentResult").html(msg+"<br>"+info1+"<br>"+info2+"<br>"+info3);
						
						
						
					}else{
						$('#paymentResult').html('에러내용 :' +rsp.error_msg+date);
						
						location.href="/successOrder.do?recipe="+noarray+"&id="+id+"&orderCode="+date+"&zipCode="+zipCode+
									"&addr1="+addr1+"&addr2="+addr2+"&phone="+phone+"&recipeCount="+noarray1;
		
					}
				});
			};

function deletecart() {
	/*
	var queryString = $("form[name=orderForm]").serialize();
	$.ajax({
		type : 'post',
		url : '/deleteCart.do',
		data : queryString,
		dataType : "json",
		success : function(json) {
			
		},
	});
	
	 * */
	var cartNo = $("[name='cartNo']:checked");
	var noarray1 = new Array();
	for(var i=0;i<cartNo.length;i++){
		noarray1[i] = cartNo.eq(i).val();
	}
	location.href="/deleteCart.do?cartNo="+noarray1;
};
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
};

$("#newAddrs").click(function() {
	$("#addrsApi").attr("type","button");
});
	
