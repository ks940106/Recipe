/**
 * 

$("document").ready(function() {
	selectCaravanA();
});
function selectCaravanA() {
	$.ajax({
		url: "/selectCaravanA.do",
		type : "POST",
		dateType : "json",
		success:function(data){
			console.log(data.caravanImg);
			//var list = data
			//var li;
			var li = $('<li data-color="#1abc9c"><img src="../resources/img/'+data.caravanMainImg+'" width="745px;"></li>');
			var li1 = $('<li data-color="#1abc9c"><img src="../resources/img/'+data.caravanImg+'" width="745px;"></li>');
			var li2 = $('<li data-color="#1abc9c"><img src="../resources/img/'+data.caravanImg1+'" width="745px;"></li>');
			$("#slider2").append(li).append(li1).append(li2);
		}
	});
}
 */
