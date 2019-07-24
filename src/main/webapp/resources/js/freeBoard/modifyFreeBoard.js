/**
 * 
 */
	$(document).ready(function(){
			$('#submit_btn').click(function(){
				var no = $('#type').val();
				var title = $('#title').val();
				var contents = $('#contents').val();
				var data = "title="+title+"&contents="+contents+"&boardNo="+no;
				$.ajax({
					url:"/modifyCompleteFreeBoard.do",
					type : "post",
					data : data,
					success : function(data){
						alert("수정에 성공했습니다");
						location.href="/freeBoard.do";
					},
					error : function(){
						alert("수정에 실패했습니다");
					}
				});
			});
		});