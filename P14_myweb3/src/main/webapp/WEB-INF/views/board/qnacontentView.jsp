<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 문의 게시판</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <div class="container">
        <!-- nav -->
		<c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header>
            <h1>안쓰는 물건 사고팔땐, <span>중고</span>마켓</h1>
        </header>

        <!-- section -->
        <section class="qna-form">
            <h2>문의 게시판</h2>
            <div class="title-wrapper">
                <p>제목</p><div class="title">${data.product_title }</div>
            </div>            
            <div class="content">${data.product_main }</div>
            <c:if test="${data.product_img!='nan' }">
						<img src="${contextPath }/board/download?file=${data.product_img }" width="200px" height="200px">
					</c:if>
            <div class="btn-wrapper">
            </div>
			<br>
			<c:if test="${data.product_writer==loginUser }">
				<input type="button" 
				       value="수정" onclick="location.href='${contextPath}/board/qnamodifyform?product_no=${data.product_no }'">
				<input type="button" 
			           value="삭제" onclick="location.href='${contextPath}/board/qnadelete?product_no=${data.product_no }&product_img=${data.product_img }'">
			</c:if>
			<input type="button" value="글목록" onclick="location.href='${contextPath}/board/qna'">
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>