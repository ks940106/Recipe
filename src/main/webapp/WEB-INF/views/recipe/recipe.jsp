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
    <form id="recipeForm" action="/recipeReg.do" method="post" enctype="multipart/form-data">
        <div class="section_content">
            <div class="regi_title">레시피 등록</div>
            <div class="cont_box pad_l_60">

                <div class="img_up_list">
                    <%--이미지 업로드--%>
                    <div class="img_box">
                        <input type="file" class="hide" accept="image/*" name="recipeMainImg" id="recipeMainImg" onchange="boardReg.imgSel(this, event)">
                        <a href="javascript:void(0);" onclick="uploadImg(this);" class="upload_btn" style="background: url('${pageContext.request.contextPath}/resources/img/recipe/pic_none4.gif') no-repeat;" ></a>
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
                        <c:forEach var="category1" items="${categories}" varStatus="">
                            <c:if test="${category1.categoryType == 1}">
                                <option value="${category1.categoryNo}">${category1.categoryName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <select name="cok_sq_category_2" id="cok_sq_category_2" text="상황별">
                        <option value="">상황별</option>
                        <c:forEach var="category2" items="${categories}" varStatus="">
                            <c:if test="${category2.categoryType == 2}">
                                <option value="${category2.categoryNo}">${category2.categoryName}</option>
                            </c:if>
                        </c:forEach>
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
                    <textarea name="cok_material" id="" class="form-control step_cont"  placeholder="<예시>
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

                <div id="divStepArea" class="ui-sortable">
                </div>



                <div class="btn_add mag_b_25" style="padding:0 0 20px 180px; width:640px;">
                    <button type="button" onclick="addStep()" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus-sign">
                    </span>
                        순서추가
                    </button>
                </div>
            </div>
            <div class="cont_box pad_l_60">
                <p class="cont_tit4">요리완성사진</p>
                <div id="divWorkArea" style="display:inline-block" class="ui-sortable">
                    <div id="divWorkUpload_1" class="complete_pic">
                        <div class="img_up_list" style="display: inline-block;vertical-align: middle; float: none; margin: 0;">
                            <%--이미지 업로드--%>
                            <div class="img_box" style="width: 140px;height: 140px;">
                                <input type="file" class="hide" accept="image/*" name="work_photo[]" id="work_photo_1" onchange="boardReg.imgSel(this, event)">
                                <a href="javascript:void(0);" onclick="uploadImg(this);" class="upload_btn" style="background: url('${pageContext.request.contextPath}/resources/img/recipe/pic_none3.gif') no-repeat;" >
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divWorkUpload_2" class="complete_pic">
                        <div class="img_up_list" style="display: inline-block;vertical-align: middle; float: none; margin: 0;">
                            <%--이미지 업로드--%>
                            <div class="img_box" style="width: 140px;height: 140px;">
                                <input type="file" class="hide" accept="image/*" name="work_photo[]" id="work_photo_2" onchange="boardReg.imgSel(this, event)">
                                <a href="javascript:void(0);" onclick="uploadImg(this);" class="upload_btn" style="background: url('${pageContext.request.contextPath}/resources/img/recipe/pic_none3.gif') no-repeat;" >
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divWorkUpload_3" class="complete_pic">
                        <div class="img_up_list" style="display: inline-block;vertical-align: middle; float: none; margin: 0;">
                            <%--이미지 업로드--%>
                            <div class="img_box" style="width: 140px;height: 140px;">
                                <input type="file" class="hide" accept="image/*" name="work_photo[]" id="work_photo_3" onchange="boardReg.imgSel(this, event)">
                                <a href="javascript:void(0);" onclick="uploadImg(this);" class="upload_btn" style="background: url('${pageContext.request.contextPath}/resources/img/recipe/pic_none3.gif') no-repeat;" >
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divWorkUpload_4" class="complete_pic">
                        <div class="img_up_list" style="display: inline-block;vertical-align: middle; float: none; margin: 0;">
                            <%--이미지 업로드--%>
                            <div class="img_box" style="width: 140px;height: 140px;">
                                <input type="file" class="hide" accept="image/*" name="work_photo[]" id="work_photo_4" onchange="boardReg.imgSel(this, event)">
                                <a href="javascript:void(0);" onclick="uploadImg(this);" class="upload_btn" style="background: url('${pageContext.request.contextPath}/resources/img/recipe/pic_none3.gif') no-repeat;" >
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="regi_btm">
                <button type="button" onclick="doSubmit('save')" class="btn-lg btn-primary">저장</button>
                <button type="button" onclick="doSubmit('save_public')" class="btn-lg btn-warning">저장 후 공개하기</button>
                <button type="button" onclick="history.back();" class="btn-lg btn-default">취소</button>
            </div>
        </div>
    </form>
    <!-- step template -->
    <div id="divStepTemplate" style="display: none">
        <div id="divStepItem_STEP" class="step" style="">
            <p id="divStepNum_STEP" class="cont_tit2_1 ui-sortable-handle" style="cursor:pointer" data-original-title="" title="">Step</p>
            <div id="divStepText_STEP" style="display:inline-block">
                <textarea name="step_text[]" id="step_text_STEP" class="form-control step_cont" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="height:160px; width:430px; resize:none;"></textarea>
            </div>
            <div id="divStepUpload_STEP" style="display:inline-block">
                <input type="hidden" name="step_no[]" id="step_no_STEP" value="">
                <%--<input type="hidden" name="step_photo[]" id="step_photo_STEP" value="">--%>
                <%--<input type="hidden" name="new_step_photo[]" id="new_step_photo_STEP" value="">--%>
                <%--<input type="hidden" name="del_step_photo[]" id="del_step_photo_STEP" value="">--%>
                <%--이미지 업로드--%>
                <div class="img_up_list" style="display: inline-block;vertical-align: middle; float: none; margin: 0;">
                    <div class="img_box" style="width: 160px;height: 160px;">
                        <input type="file" class="hide" accept="image/*" name="step_photo[]" id="step_photo_STEP" onchange="boardReg.imgSel(this, event)">
                        <a href="javascript:void(0);" onclick="uploadImg(this);" class="upload_btn" style="background: url('${pageContext.request.contextPath}/resources/img/recipe/pic_none2.gif') no-repeat;" >
                        </a>
                    </div>
                </div>
            </div>
            <div id="divStepBtn_STEP" class="step_btn" style="display: none;">
                <a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-up moveUp"></span></a>
                <a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-down moveDown"></span></a>
                <a href="javascript:addStep(__Step)"><span class="glyphicon glyphicon-plus"></span></a>
                <a href="javascript:delStep(__Step)"><span class="glyphicon glyphicon-remove"></span></a>
            </div>
        </div>
    </div>
    <!--/step template-->
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/recipe.js"></script>
</html>