/**
 * 
 */
$(document).ready(function () {
			var totalpay=0;
			$(".count").change(function () {
				if($(this).is(':checked')){
					//totalpay += (Number)($(".co").val());
					totalpay += (Number)($(this).parent().siblings(".co").text());
				}else{
					totalpay -= (Number)($(this).parent().siblings(".co").text());
				}
				$("#countSpan").html(totalpay);
			});
			$("#payment").click(function () {
				var price = $("#countSpan").html();
				var d = new Date();
				var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
				IMP.init('imp40592834');
				IMP.request_pay({
				 merchant_uid : "상품명_"+date,	//거래ID
				 name : "걸제테스트",				//결제명
				 amount : price,				//결제금액
				 buyer_email : "rudtjr008@naver.com",	//구매자 email
				 buyer_name	: '고경석',					//구매자 이름
				 buyer_tel	: '010-3337-4380',
				 buyer_addr : '부천',
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
					}
				});
			});
		});