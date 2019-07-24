/**
 * 
 */

$(document).ready(function(){
			$('#submit_btn').click(function(){
				var title = $("#title").val();
				var contents = $("#contents").val();
				if(title == ""){
					alert("제목을 적어주세요");
				}else if(contents == ""){
					alert("내용을 적어주세요");
				}else{
				var nickname = $('#nickname').val();
				var type = $('#type').val();
				var title = $('#title').val();
				var contents = $('#contents').val();
				var data = "nickname="+nickname+"&boardType="+type+"&title="+title+"&contents="+contents;
				$.ajax({
					url:"/newFreeBoard.do",
					type : "post",
					data : data,
					success : function(data){
						alert("새글 등록에 성공했습니다");
						location.href="/freeBoard.do";
					},
					error : function(){
						alert("새들 등록에 실패했습니다");
					}
				});
			}
			});
		});

function check(){
	var title = $("#title").val();
	var contents = $("#contents").val();
	console.log(title);
	console.log(contents);
}