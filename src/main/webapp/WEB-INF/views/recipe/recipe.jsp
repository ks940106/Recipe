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
        <div class="regi_title">레시피 등록</div>
        <div class="cont_box pad_l_60">

            <div class="img_up_list">
                <%--이미지 업로드--%>
                <div class="img_box">
                    <input type="file" class="hide" accept="image/*" name="recipeMainImg" id="recipeMainImg" onchange="boardReg.imgSel(this, event)">
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
        <div class="cont_box pad_l_60">
            <span class="guide mag_b_15" style="width:100%;">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
            <div class="cont_line pad_b_25">
                <p class="cont_tit4">재료</p>
                <textarea name="" id="" class="form-control step_cont"  placeholder="<예시>
[스테이크 재료] 돼지고기 500g, 양파 1/2개, 고추 1개, 간장
[파절임] 대파 3개, 고춧가루 1숟가락, 매실엑기스 3숟가락, 식초 3숟가락
[양념] 고춧가루 2T, 진간장 1T, 참치액 1T, 참기름 1T, 매실액 1T, 통깨 " style="height:200px; width:610px; resize:none;"></textarea>
            </div>
            <div class="noti">
                ※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.
            </div>
        </div>
        <div class="cont_box pad_l_60">
            <p class="cont_tit3">요리순서</p>
            <span class="guide mag_b_15"><b style="font-weight: bold;">요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</b><br>
		예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.</span>



            <div id="divStepItem_1" class="step" style="">
                <p id="divStepNum_1" class="cont_tit2_1 ui-sortable-handle" style="cursor:pointer" data-original-title="" title="">Step1</p>
                <div id="divStepText_1" style="display:inline-block">
                    <textarea name="step_text[]" id="step_text_1" class="form-control step_cont" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="height:160px; width:430px; resize:none;"></textarea>
                </div>
                <div id="divStepUpload_1" style="display:inline-block">
                    <input type="hidden" name="step_no[]" id="step_no_1" value="">
                    <input type="hidden" name="step_photo[]" id="step_photo_1" value="">
                    <input type="hidden" name="new_step_photo[]" id="new_step_photo_1" value="">
                    <input type="hidden" name="del_step_photo[]" id="del_step_photo_1" value="">
                    <div class="img_up_list">
                        <%--이미지 업로드--%>
                        <div class="img_box">
                            <input type="file" class="hide" accept="image/*" name="imgStep1" id="imgStep1" onchange="boardReg.imgSel(this, event)">
                            <a href="#none" class="upload_btn" >
                            </a>
                        </div>
                    </div>
                </div>
                <div id="divStepBtn_1" class="step_btn" style="display: none;">
                    <a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-up moveUp"></span></a>
                    <a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-down moveDown"></span></a>
                    <a href="javascript:adjustStep(1)"><b>맞춤</b></a>
                    <a href="javascript:addStep(1)"><span class="glyphicon glyphicon-plus"></span></a>
                    <a href="javascript:delStep(1)"><span class="glyphicon glyphicon-remove"></span></a>
                </div>
            </div>




            <!-- step template -->
            <div id="divStepTemplate" style="display:none">
                <div id="divStepItem_STEP" class="step">
                    <p id="divStepNum_STEP" class="cont_tit2_1" style="cursor:pointer">Step 1</p>
                    <div id="divStepText_STEP" style="display:inline-block">
                        <textarea name="step_text[]" id="step_text_STEP" class="form-control step_cont" placeholder="" style="height:160px; width:430px; resize:none;"></textarea>
                    </div>
                    <div id="divStepUpload_STEP" style="display:inline-block">
                        <input type="hidden" name="step_no[]" id="step_no_STEP" value="">
                        <input type="hidden" name="step_photo[]" id="step_photo_STEP" value="">
                        <input type="hidden" name="new_step_photo[]" id="new_step_photo_STEP" value="">
                        <input type="hidden" name="del_step_photo[]" id="del_step_photo_STEP" value="">
                        <div style="position:absolute;left:-3000px"><input type="file" name="q_step_file_STEP" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif" style="display:none;width:0px;height:0px;font-size:0px;" text=""></div>
                        <div id="divStepPhotoBox_STEP" is_over="0">
                            <img id="stepPhotoHolder_STEP" onclick="browseStepFile(__STEP)" src="${pageContext.request.contextPath}/resources/img/recipe/pic_none2.gif" width="160" height="160" style="cursor:pointer">
                        </div>
                    </div>
                    <div id="divStepBtn_STEP" class="step_btn" style="display:none">
                        <a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-up moveUp"></span></a>
                        <a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-down moveDown"></span></a>
                        <a href="javascript:adjustStep(__STEP)"><b>맞춤</b></a>
                        <a href="javascript:addStep(__STEP)"><span class="glyphicon glyphicon-plus"></span></a>
                        <a href="javascript:delStep(__STEP)"><span class="glyphicon glyphicon-remove"></span></a>
                    </div>

                </div>
            </div>
            <!--/step template-->

            <div class="btn_add mag_b_25" style="padding:0 0 20px 180px; width:640px;">
                <button type="button" onclick="addStep()" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus-sign">
                    </span>
                    순서추가
                </button>
            </div>
        </div>
        <div class="regi_btm">
            <button type="button" onclick="doSubmit('save')" class="btn-lg btn-primary">저장</button>
            <button type="button" onclick="doSubmit('save_public')" class="btn-lg btn-warning">저장 후 공개하기</button>
            <button type="button" onclick="history.back();" class="btn-lg btn-default">취소</button>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript" src="/resources/js/recipe.js"></script>
</html>