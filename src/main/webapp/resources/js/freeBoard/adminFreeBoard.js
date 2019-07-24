/**
 * 
 */
	function deleteFreeBoard(no){
		$.ajax({
			url : "/adminFreeBoardDelete.do",
			type : "post",
			data : {no:no},
			success : function(){
				alert("삭제성공");
				location.href="/adminFreeBoard.do";
			},
			error : function(){
				alert("삭제실패");
			}
		});
	}
	function select(boardNo){
		location.href="/adminFreeBoardView.do?boardNo="+boardNo;
	}
	
	
