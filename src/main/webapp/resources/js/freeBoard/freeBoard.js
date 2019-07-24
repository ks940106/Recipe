/**
 * 
 */
function insert(nickname){
			if(nickname != null){
			location.href="/insertFreeBoard.do?boardType=1";
			}else{
				alert("로그인해 주세요");
			}
		}
		
		function select(boardNo){
			location.href="/selectFreeBoard.do?boardNo="+boardNo;
		}