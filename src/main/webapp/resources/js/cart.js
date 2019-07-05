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
				console.log(noarray);
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
									"&addr1="+addr1+"&addr2="+addr2+"&phone="+phone+"&recipeCount="+noarray1
					}
				});
			};

