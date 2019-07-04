var goods = {


	regType: function () {


	},


	regDelete: function (e) {

		$(e).parents('tr').remove();

	},

	newGoodsAdd: function (type) {


		var goodsName = $('#goodsName');
		var goodsPlace = $('#goodsPlace');
		var goodsAmount = $('#amount');

		if (goodsName.val() == "") {
			alert("상품명을 입력해주세요");
			goodsName.focus();
			return;
		}

		if (goodsPlace.val() == "") {
			alert("재고위치를 입력해주세요.");
			goodsName.focus();
			return;
		}


		var chk = goods.nameChk(goodsName.val());

		if (chk != 0) {
			alert("같은 상품명으로 상품을 등록할 수 없습니다.");

			return;
		}

		var str = "";
		str += "<tr>"
		str += "	<input type='hidden' name='goodsIdx' value='0'>";
		str += "	<input type='hidden' name='goodsType' value='" + type + "'>";
		str += "	<td>" + goodsName.val() + "</td>";
		str += "	<td>" + goodsPlace.val() + "</td>";
		str += "<td>" + goodsAmount.val() + "</td>";
		str += "<td>";
		str += "<div>";
		str += "<a href='#none' class='btn small col_darkGrey f_w' onclick='goods.regDelete(this)'>삭제</a>";
		str += "	</div>";
		str += "	</td>";
		str += "</tr>";

		$('.list_table tbody').append(str);


	},

	oldGoodsAdd: function (type) {


		var goodsIdx  = $('#goodsName');
		var goodsName = $('#goodsName').find('option:selected');

		console.log(goodsName.text())

		var goodsPlace = $('#goodsPlace');
		var goodsAmount = $('#amount');

		if (goodsPlace.val() == "") {
			alert("재고위치를 입력해주세요.");
			goodsName.focus();
			return;
		}

		var str = "";
		str += "<tr>"
		str += "	<input type='hidden' name='goodsIdx' value='" + goodsIdx.val() +"'>";
		str += "	<input type='hidden' name='goodsType' value='" + type + "'>";
		str += "	<td>" + goodsName.text() + "</td>";
		str += "	<td>" + goodsPlace.val() + "</td>";
		str += "<td>" + goodsAmount.val() + "</td>";
		str += "<td>";
		str += "<div>";
		str += "<a href='#none' class='btn small col_darkGrey f_w' onclick='goods.regDelete(this)'>삭제</a>";
		str += "	</div>";
		str += "	</td>";
		str += "</tr>";

		$('.list_table tbody').append(str);


	},

	oldRegGoods: function (type) {

		var listCount = $('.list_table tbody tr').length;


		if (listCount == 0) {
			alert("상품을 등록해주세요");
			return;
		}
		var goodsList = new Array();
		for (var i = 0; i < listCount; i++) {
			var data = new Object();
			// console.log($('.list_table tbody tr').eq(i).find('td:nth-of-type(1)').text());

			data.goodsIdx = $('.list_table tbody tr').eq(i).find('input[name=goodsIdx]').val();
			data.goodsType = $('.list_table tbody tr').eq(i).find('input[name=goodsType]').val();
			data.goodsName = $('.list_table tbody tr').eq(i).find('td:nth-of-type(1)').text();
			data.goodsPlace = $('.list_table tbody tr').eq(i).find('td:nth-of-type(2)').text();
			data.goodsAmount = $('.list_table tbody tr').eq(i).find('td:nth-of-type(3)').text();

			goodsList.push(data);

		}

		$.ajax({
			url: "/stock/oldRegProc",
			data: {
				goods: JSON.stringify(goodsList),
			},

			success: function (data) {

				if (data.trim() == "Y") {
					alert("등록 완료");
					location.reload();
				} else if (data.trim() == "N") {
					alert('등록 실패');
				}

			}, error: function () {

			}
		})


	},



	nameChk: function (goodsName) {

		var listCount = $('.list_table tbody tr').length;
		var chk = 0;
		for (var i = 0; i < listCount; i++) {

			if (goodsName == $('.list_table tbody tr').eq(i).find('td:nth-of-type(1)').text()) {
				chk++;
				break;
			}
		}

		return chk;


	},


	newRegGoods: function (type) {

		var listCount = $('.list_table tbody tr').length;


		if (listCount == 0) {
			alert("상품을 등록해주세요");
			return;
		}
		var goodsList = new Array();
		for (var i = 0; i < listCount; i++) {
			var data = new Object();
			// console.log($('.list_table tbody tr').eq(i).find('td:nth-of-type(1)').text());

			data.goodsIdx = $('.list_table tbody tr').eq(i).find('input[name=goodsIdx]').val();
			data.goodsType = $('.list_table tbody tr').eq(i).find('input[name=goodsType]').val();
			data.goodsName = $('.list_table tbody tr').eq(i).find('td:nth-of-type(1)').text();
			data.goodsPlace = $('.list_table tbody tr').eq(i).find('td:nth-of-type(2)').text();
			data.goodsAmount = $('.list_table tbody tr').eq(i).find('td:nth-of-type(3)').text();

			goodsList.push(data);

		}

		$.ajax({
			url: "/stock/newRegProc",
			data: {
				goods: JSON.stringify(goodsList),
			},

			success: function (data) {

				if (data.trim() == "Y") {
					alert("등록 완료");
					location.reload();
				} else if (data.trim() == "N") {
					alert('등록 실패');
				}

			}, error: function () {

			}
		})


	},
};

