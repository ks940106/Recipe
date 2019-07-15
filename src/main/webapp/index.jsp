<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>프레시</title>
    <link href="../resources/css/fresh.css" rel="stylesheet" />

</head>
<body>
<body>

		<div id="IntroTop">
			<div class="left">
				<img src="../../resources/img/logo2.png">
			</div>
			<div class="right">
				<div class="introTopWrap">
				</div>
			</div>
		</div>


		<div id="IntroVisual">
			<div class="left" onclick="location.href='/Contents/contents.php'">
				<div class="bg">
					<p><a href="/views/singSingRecipe.jsp"><img src="../../resources/img/button_left.png" class="go_basic"><img src="../../resources/img/left_go.png" class="go_over"><img src="../../resources/img/left_go_m.png" class="go_m"></a></p>
				</div>
				<div class="shadow">
				</div>
			</div>
			<div class="right" onclick="location.href='/California/contents.php'">
				<div class="bg">
					<p><a href="/views/singsingCampingIndex.jsp"><img src="../../resources/img/button_right.png?ver=0705" class="go_basic"><img src="../../resources/img/right_go.png" class="go_over"><img src="../../resources/img/right_go_m.png" class="go_m"></a></p>
				</div>
				<div class="shadow">
				</div>
            </div>
		</div>

          <!-- 팝업불러오기 시작 -->
          <!--
           <div id="PopupWrap">
            <form name="popup_frm">
              <ul>

                                <li>
                  <div id="Popup_p11" class="popup">
                    <div class="popimg">
                                                                  <a href="/Contents/contents.php?cmsNo=DD0100&act=view/detail/32"><img src="/images/intro/popup01.jpg"></a>
                                                                </div>
                    <div class="close">
                      <span class="text"><input type="checkbox" name="check_p11" id="check_p11" value="" onClick="javascript:closePopup('p11')"> 오늘 하루 이 창 띄우지 않기</span>
                      <span class="button"><a href="#" onClick="javascript:closePopup('p11')">닫기</a></span>
                    </div>
                  </div>
                </li>

                                <!--
                                <li>
                  <div id="Popup_p12" class="popup">
                    <div class="popimg">
                                                                  <a href="/California/contents.php?cmsNo=WD0100&act=view/detail/23" target="_self"><img src="/Board/boardFile.php?key=269&mode=view"></a>
                                                                </div>
                    <div class="close">
                      <span class="text"><input type="checkbox" name="check_p12" id="check_p12" value="" onClick="javascript:closePopup('p12')"> 오늘 하루 이 창 띄우지 않기</span>
                      <span class="button"><a href="#" onClick="javascript:closePopup('p12')">닫기</a></span>
                    </div>
                  </div>
                </li>-->
<!--
              </ul>
            </form>
          </div>
          <!-- 팝업불러오기 끝 -->



		<script src="/js/jquery.bxslider.min.js"></script>
		<!--
		<div id="IntroBanner">
			<ul class="bxslider">
        <li><a href="/California/contents.php" target="_self"><img src="/Board/boardFile.php?key=327&mode=view"><img src="/Board/boardFile.php?key=328&mode=view"></a></li>			</ul>
		</div>
		-->
		<!-- 하단 Wrap 시작 -->
		
		<!-- 하단 Wrap 끝 -->
		<script type="text/javascript">
		$(document).ready(function(){

			if ( getCookie( "check_p11" ) == "done") {
			$("#Popup_p11").hide();
		  }
		  });
		$(document).ready(function(){

			var slider = $('#IntroBanner .bxslider').bxSlider({
				auto: true,
				pager: false,
				controls: false
			});

			

			$('#BottomGoTop').click(function() {
				$("html, body").animate({scrollTop: 0}, 500);
			});

			$('#BottomFamily > ul > li').click(function() {
				$(this).toggleClass("on");
			});


		});
		</script>

		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
		<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "b98b9d80c1c8a8";
		wcs_do();
		</script>

	


</body>
</body>
</html>