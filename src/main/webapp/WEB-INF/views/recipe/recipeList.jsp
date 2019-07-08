<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>싱싱레시피 요리대회</title>
    <link href="../resources/css/import.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- header Fin -->
<section>
    <div class="pom_bg">
        <div class="pom_top">
            <h1>레시피</h1>
            <div id="pom_div_bg"></div>
            <%--<p>자연속에서 즐기는 요리대회</p>--%>
        </div>
    </div>
    <div class="pom_wrap">
        <%--<div class="pomNav">--%>
        <%--<jsp:include page="/WEB-INF/views/common/navPom.jsp"/>--%>
        <%--</div>--%>
        <div class="section_content">
            <div class="cp_content">
                <%--검색필터--%>
                <table class="table">
                    <tr>
                        <th>제목</th>
                        <td colspan="2"><input type="text"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="2"><input type="text"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <label>카테고리1<select></select></label>
                        </td>
                        <td>
                            <label>카테고리2<select></select></label>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
