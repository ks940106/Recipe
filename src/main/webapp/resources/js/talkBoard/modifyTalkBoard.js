/**
 * 
 */
 $(document).ready(function(){
	 var imgN = $("#imgN").val();
	 console.log(imgN);
	 	var files = {};
		var no = $('.preview:last').attr('value');
		var previewIndex = ++no;

	
		$(document).on('change','.uploadInputBox',function() {
							imgN++;
							$(this).css('display', 'none');
							$('#attach2').append("<input class='uploadInputBox' id='img_"+imgN+"' type='file' name='filedata'/>");
						});

		//임의의 file object영역
		// image preview 기능 구현
		// input = file object[]
		function addPreview(input) {
			if (input[0].files) {
				//파일 선택이 여러개였을 시의 대응
				for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
					var file = input[0].files[fileIndex];

					if (validation(file.name))
						continue;
					setPreviewForm(file);
				}
			} else
				alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
		}

		function setPreviewForm(file, img) {

			var reader = new FileReader();
			reader.onload = function(img) {
				//div id="preview" 내에 동적코드추가.
				//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.

				var imgNum = previewIndex++;
				$("#attach")
						 .append(
                                        "<div class=\"preview\" value=\"" + imgNum +"\">"
                                                + "<img href='#:;' class=\"thumbnail\" onclick='deletePreview(this)' value="+imgNum+" src=\"" + img.target.result + "\"\/>"
                                                + "<p style='display:none'>"
                                                + file.name
                                                + "</p><br>"
                                                +"<input type='hidden' name='fileName' value='"+file.name+"'>"
                                                + "</div>");
				files[imgNum] = file;
			};
			reader.readAsDataURL(file);
		}

		//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
		function deletePreview(obj) {
			console.log(obj);
			var imgNum = obj.attributes['value'].value;
			delete files[imgNum];
			$(".preview[value=" + imgNum + "]").remove();
			$("#img_" + imgNum + "").remove();
		}

		//client-side validation
		//always server-side validation required
		function validation(fileName) {
			fileName = fileName + "";
			var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
			var fileNameExtension = fileName.toLowerCase().substring(
					fileNameExtensionIndex, fileName.length);
			if (!((fileNameExtension === 'jpg')
					|| (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
				alert('jpg, gif, png 확장자만 업로드 가능합니다.');
				return true;
			} else {
				return false;
			}
		}

		$(document).on('click', '.uploadInputBox', function() {
			// <input type=file> 태그 기능 구현
			console.log("클릭");
			$(this).change(function() {
				addPreview($(this)); //preview form 추가하기
				console.log("프리뷰 추가");
			});
		});
 });