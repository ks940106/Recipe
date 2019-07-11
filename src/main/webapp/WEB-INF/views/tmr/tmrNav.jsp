<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav class="nav_wrap">
	<div class="nav_con">
		<div class="nav_title">이달의 레시피</div>
		<ul class="nav_menu">
			<li>
                <a href="javascript:popup()" target="_blank">이달의 레시피 혜택 안내</a><span>></span>
            </li>
            <li>
                <a href="/c.do">(임시)달력 가기</a><span>></span>
            </li>
		</ul>
	</div>
	<script>
	function popup(){
		 var url = "/popup.do";
      var name = "이달의 레시피 혜택";
      var option = "width = 700, height = 700, top = 100, left = 200, location = no"
      window.open(url, name, option);
	}
	</script>
</nav>