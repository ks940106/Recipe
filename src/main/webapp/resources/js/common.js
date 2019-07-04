
var amount	=	{

	change	: function (e, type) {

		var input	=	$(e).siblings('input');

		if(type == "P"){

			input.val(parseInt(input.val())+1);


		}else if(type == "M"){

			if(input.val() == 1){
				return;
			}
			input.val(parseInt(input.val())-1);


		}
	}

};