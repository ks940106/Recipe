<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>싱싱레시피</title>
    <link href="/resources/css/import.css" rel="stylesheet" />
    <link href="/resources/css/page.css" rel="stylesheet"/>
    <link href="/resources/css/recipe.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- header Fin -->
<section>
    <div class="section_content">
        <div class="register_title">레시피 등록</div>
        <div class="cont_box pad_l_60">

            <div class="img_up_list">
                <!-- 업로드 전 -->
                <div class="img_box">
                    <input type="file" class="hide" accept="image/*" name="noticeBoardFilename" id="noticeBoardFilename" onchange="boardReg.imgSel(this, event)">
                    <a href="#none" class="upload_btn">
                    </a>
                </div>
            </div>
            <div class="cont_line"><p class="cont_tit4">레시피 제목</p><input type="text" name="cok_title" id="cok_title" value="" class="form-control" placeholder="예) 소고기 미역국 끓이기" style="width:610px; ">
            </div>

            <div class="cont_line pad_b_25"><p class="cont_tit4">요리소개</p><textarea name="cok_intro" id="cok_intro" class="form-control step_cont" placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다." style="height:100px; width:610px; resize:none;"></textarea></div>

            <div class="cont_line pad_b_25">
                <p class="cont_tit4">동영상</p>
                <textarea name="cok_video_url" id="cok_video_url" class="form-control step_cont" prev_url="" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpot 만 가능) 예)http://youtu.be/lA0Bxo3IZmM" style="height:100px; width:380px; resize:none;"></textarea>
                <div id="divVideoPhotoBox" is_over="0" class="thumb_m"><img id="videoPhotoHolder" src="${pageContext.request.contextPath}/resources/img/recipe/pic_none5.gif" style="width: 178px; height: 100px;"></div>
            </div>

            <div class="cont_line"><p class="cont_tit4">카테고리</p>
                <select name="cok_sq_category_1" id="cok_sq_category_1" text="종류별">
                    <option value="">종류별</option>
                    <option value="63">밑반찬</option>
                    <option value="56">메인반찬</option>
                    <option value="54">국/탕</option>
                    <option value="55">찌개</option>
                    <option value="60">디저트</option>
                    <option value="53">면/만두</option>
                    <option value="52">밥/죽/떡</option>
                    <option value="61">퓨전</option>
                    <option value="57">김치/젓갈/장류</option>
                    <option value="58">양념/소스/잼</option>
                    <option value="65">양식</option>
                    <option value="64">샐러드</option>
                    <option value="68">스프</option>
                    <option value="66">빵</option>
                    <option value="69">과자</option>
                    <option value="59">차/음료/술</option>
                    <option value="62">기타</option>
                </select>
                <select name="cok_sq_category_2" id="cok_sq_category_2" text="상황별">
                    <option value="">상황별</option>
                    <option value="12">일상</option>
                    <option value="18">초스피드</option>
                    <option value="13">손님접대</option>
                    <option value="19">술안주</option>
                    <option value="21">다이어트</option>
                    <option value="15">도시락</option>
                    <option value="43">영양식</option>
                    <option value="17">간식</option>
                    <option value="45">야식</option>
                    <option value="20">푸드스타일링</option>
                    <option value="46">해장</option>
                    <option value="44">명절</option>
                    <option value="14">이유식</option>
                    <option value="22">기타</option>
                </select>
                <span class="guide" style="margin:-22px 0 0 146px;">분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</span>
            </div>
            <div class="cont_line"><p class="cont_tit4">요리정보</p>
                인원
                <select name="cok_portion" id="cok_portion" text="인원">
                    <option value="">인원</option><option value="1">1인분</option>
                    <option value="2">2인분</option>
                    <option value="3">3인분</option>
                    <option value="4">4인분</option>
                    <option value="5">5인분</option>
                    <option value="6">6인분이상</option>
                </select>
                <span class="pad_l_30">시간 </span>
                <select name="cok_time" id="cok_time" text="요리시간">
                    <option value="">시간</option><option value="5">5분이내</option>
                    <option value="10">10분이내</option>
                    <option value="15">15분이내</option>
                    <option value="20">20분이내</option>
                    <option value="30">30분이내</option>
                    <option value="60">60분이내</option>
                    <option value="90">90분이내</option>
                    <option value="120">2시간이내</option>
                    <option value="999">2시간이상</option>
                </select>
                <span class="pad_l_30">난이도 </span>
                <select name="cok_degree" id="cok_degree" text="난이도">
                    <option value="">난이도</option><option value="1">아무나</option>
                    <option value="2">초급</option>
                    <option value="3">중급</option>
                    <option value="4">고급</option>
                    <option value="5">신의경지</option>
                </select>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript" src="/resources/js/recipe.js"></script>
</html>