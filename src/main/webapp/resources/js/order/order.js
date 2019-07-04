var order	=	{

	goodsTypeSelect	:	function () {

		var typeSelect	=	$('#typeSelect');
		var goodsSelect	=	$('#goodsSelect');
		var detailWrap	=	$('tbody.goodsDetail');


		detailWrap.html("");


		if(typeSelect.val() == 'pump' || typeSelect.val() == 'motor'){

			goodsSelect.prop("disabled",false);


		}else{

			goodsSelect.prop("disabled",true);

		}

		$.ajax({
			data		:	{goodsType : typeSelect.val()},
			dataType	:	"JSON",
			url			:	"/order/goodsSelect",
			success		:	function (data) {

				var str	=	"<option value=''>상품 선택</option>";



				if(data.length != 0){

					for(var i = 0 ; i < data.length; i++){

						str	+=	"<option value='"+ data[i].goodsIdx +"'>" + data[i].goodsName + "</option>";

					}
				}



				goodsSelect.html(str);





			},
			error		:	function () {

			}

		})

	},

	goodsSelect : function () {

		var typeSelect	=	$('#typeSelect');
		var goodsSelect	=	$('#goodsSelect');
		var detailWrap	=	$('tbody.goodsDetail');

		var pumpStr		=	"";
		pumpStr			+=	"<tr>";
		pumpStr			+=	"	<th>동력(Kw)</th>";
		pumpStr			+=	"	<td>";
		pumpStr			+=	"		<input class='tbox' id='kw' name='kw'>";
		pumpStr			+=	"	</td>";
		pumpStr			+=	"</tr>";
		pumpStr			+=	"<tr>";
		pumpStr			+=	"	<th>유량</th>";
		pumpStr			+=	"	<td>";
		pumpStr			+=	"		<input class='tbox' id='flow' name='flow' >";
		pumpStr			+=	"	</td>";
		pumpStr			+=	"</tr>";
		pumpStr			+=	"<tr>";
		pumpStr			+=	"	<th>양정</th>";
		pumpStr			+=	"	<td>";
		pumpStr			+=	"		<input class='tbox' id='lift' name='lift'>";
		pumpStr			+=	"	</td>";
		pumpStr			+=	"</tr>";
		pumpStr			+=	"<tr>";
		pumpStr			+=	"	<th>시리얼넘버</th>";
		pumpStr			+=	"	<td>";
		pumpStr			+=	"		<input class='tbox' id='serial' name='serial'>";
		pumpStr			+=	"	</td>";
		pumpStr			+=	"</tr>";

		var motorStr	=	"";
		motorStr		+=	"<tr>";
		motorStr		+=	"	<th>동력(Kw)</th>";
		motorStr		+=	"	<td>";
		motorStr		+=	"		<input class='tbox' id='kw' name='kw'>";
		motorStr		+=	"	</td>";
		motorStr		+=	"</tr>";
		motorStr		+=	"<tr>";
		motorStr		+=	"	<th>전압</th>";
		motorStr		+=	"	<td>";
		motorStr		+=	"		<label>";
		motorStr		+=	"			<input type='radio' name='voltage' value='220'><span>220</span>";
		motorStr		+=	"		</label>";
		motorStr		+=	"		<label class='ml10'>";
		motorStr		+=	"			<input type='radio' name='voltage' value='220/380'><span>220/380</span>";
		motorStr		+=	"		</label>";
		motorStr		+=	"		<label class='ml10'>";
		motorStr		+=	"			<input type='radio' name='voltage' value='380'><span>380</span>";
		motorStr		+=	"		</label>";
		motorStr		+=	"		<label class='ml10'>";
		motorStr		+=	"			<input type='radio' name='voltage' value='440'><span>440</span>";
		motorStr		+=	"		</label>";
		motorStr		+=	"	</td>";
		motorStr		+=	"</tr>";
		motorStr		+=	"<tr>";
		motorStr		+=	"	<th>시리얼넘버</th>";
		motorStr		+=	"	<td>";
		motorStr		+=	"		<input class='tbox' id='serial' name='serial'>";
		motorStr		+=	"	</td>";
		motorStr		+=	"</tr>";


		if(typeSelect.val() == "pump"){

			detailWrap.html(pumpStr);

		}else if(typeSelect.val() == "motor"){

			detailWrap.html(motorStr);

		}

	},

	reg_goods	:	function () {


		var typeCode		=	$('#typeSelect').val();
		var goodsCode		=	$('#goodsSelect').val();
		var typeName	=	$('#typeSelect option:selected').text();
		var goodsName	=	$('#goodsSelect option:selected').text();
		var kw			=	$('#kw').val();
		var flow		=	$('#flow').val();
		var lift		=	$('#lift').val();
		var voltage		=	$('input[name=voltage]:checked').val();
		var serial		=	$('#serial').val();


		if(typeCode == 'pump'){

			if(kw == ""){
				alert('동력을 입력해주세요');
				$('#kw').focus();
				return;
			}

			if(flow == ""){
				alert('유량을 입력해주세요');
				$('#flow').focus();
				return;
			}

			if(lift == ""){
				alert('양정을 입력해주세요');
				$('#lift').focus();
				return;
			}

			if(serial == ""){
				alert('시리얼넘버를 입력해주세요');
				$('#serial').focus();
				return;
			}

		}else if(typeCode == 'motor'){

			if(kw == ""){
				alert('동력을 입력해주세요');
				$('#kw').focus();
				return;
			}

			if(voltage == null){
				alert('전력을 선택해주세요');
				$('input[name=voltage]').focus();
				return;
			}

			if(serial == ""){
				alert('시리얼넘버를 입력해주세요');
				$('#serial').focus();
				return;
			}
		}


		var str			=	"";
		str				+=	"<tr>";
		str				+=	"	<input type='hidden' name='typeCode' value='"+typeCode+"'>";
		str				+=	"	<input type='hidden' name='goodsCode' value='"+goodsCode+"'>";
		str				+=	"	<td>" + typeName + "</td>";
		str				+=	"	<td>" + goodsName + "</td>";
		str				+=	"	<td>" + kw + "</td>";
		str				+=	"	<td>" + (flow != null ? flow : '-') + "</td>";
		str				+=	"	<td>" + (lift != null ? lift : '-') + "</td>";
		str				+=	"	<td>" + (voltage != null ? voltage : '-') + "</td>";
		str				+=	"	<td>" + serial + "</td>";
		str				+=	"	<td>";
		str				+=	"		<a href='#none' class='btn small col_darkGrey f_w' onclick='order.reg_delete(this)'>삭제</a>";
		str				+=	"	</td>";
		str				+=	"</tr>";

		$('.list_table tbody').append(str);


	},

	reg_delete	:	function (e) {

		$(e).parents('tr').remove();

	},

	reg_order	:	function () {

		var listCount	=	$('.list_table tbody tr').length;

		if(listCount == 0){
			alert("상품을 등록해주세요");
			return;
		}

		var goodsList 	= new Array();




		for(var i = 0; i < listCount ; i++){
			var data = new Object() ;
			// console.log($('.list_table tbody tr').eq(i).find('td:nth-of-type(1)').text());

			data.goodsType		=	$('.list_table tbody tr').eq(i).find('input[name=typeCode]').val();
			data.goodsCode		=	$('.list_table tbody tr').eq(i).find('input[name=goodsCode]').val();
			data.goodsName		=	$('.list_table tbody tr').eq(i).find('td:nth-of-type(2)').text();
			data.kw				=	$('.list_table tbody tr').eq(i).find('td:nth-of-type(3)').text();
			data.flow			=	$('.list_table tbody tr').eq(i).find('td:nth-of-type(4)').text();
			data.lift			=	$('.list_table tbody tr').eq(i).find('td:nth-of-type(5)').text();
			data.voltage		=	$('.list_table tbody tr').eq(i).find('td:nth-of-type(6)').text();
			data.serial			=	$('.list_table tbody tr').eq(i).find('td:nth-of-type(7)').text();

			goodsList.push(data);

		}

		$.ajax({
			url	:	"/order/regProc",
			data : {
				goods 		: JSON.stringify(goodsList),
				orderDate  	: $('input[name=orderDate]').val(),
				orderClient	: $('input[name=orderClient]').val(),
				dueDate  	: $('input[name=dueDate]').val(),
				orderMsg  	: $('textarea[name=orderMsg]').val(),
				orderMemo  	: $('textarea[name=orderMemo]').val(),
			},
			success:function (data) {

				if(data.trim() == "Y"){
					alert('등록 완료');
					location.reload();
				}else{
					alert("등록 실패");
				}

			},
			error:function () {

				alert("에러발생. 관리자에게 문의하세요")

			}
		});








	},

	order_cancel : function (idx) {

		console.log("??")

		if(confirm("취소 처리하시겠습니까?")){

			$.ajax({
				url	:	"/order/orderCancel",
				data : {idx : idx},
				success:function (data) {

					if(data.trim()=="Y"){
						alert("최소 처리되었습니다.")
						location.reload();
					}else{
						alert("취소 안됨")
					}
				}, error:function () {
					alert("에러 발생")
				}
			})
		}

	},

	modifyOrder	:	function () {


		if(confirm("수정하시겠습니까?")){


			var formData	=	$('#orderInfoFrm').serialize();
			console.log(formData)

			$.ajax({
				url	:	"/order/orderInfoModify",
				data : $('#orderInfoFrm').serialize(),
				dataType : "html",

				// contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success:function (data) {

					if(data.trim()=="Y"){
						alert("수정 처리되었습니다.");
						location.reload();
					}else{
						alert("수정 안됨")
					}
				},
				error:function () {
					alert("에러 발생")
				}
			});



			// $.ajax({
			// 	url	:	"/order/orderInfoModify",
			// 	data : formData,
			// 	dataType : "html",
			// 	success:function (data) {
			//
			// 		if(data.trim() == "Y"){
			// 			alert("수정 완료");
			// 			location.reload();
			// 		}else{
			// 			alert("수정 실패");
			// 		}
			//
			// 	},
			// 	error:function () {
			// 		// alert("에러 발생");
			// 	}
			// });



		}

	}

};
