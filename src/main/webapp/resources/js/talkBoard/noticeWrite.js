/**
 * 
 */

function insert(){
	var content = $('#content').val();
	var title = $('#title').val();
	if(title == ""){
		alert("공지사항 제목을 작성해주세요");
		return false;
	}
	if(content==""){
		alert("공지사항 내용을 적어주세요");
		return false;
	}
}
