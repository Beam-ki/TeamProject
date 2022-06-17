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
    <title> 팝니다.</title>
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
        <section>
            <div class="detail">
                <div class="detail-img">
                    <c:if test="${data.product_img=='nan' }">
						<b>이미지가 없습니다</b>
					</c:if>
					<c:if test="${data.product_img!='nan' }">
						<img src="${contextPath }/board/download?file=${data.product_img }" width="200px" height="200px">
					</c:if>
                </div>
                <div class="detail-article">
                    <h2>${data.product_title }</h2>
                    <h2>${data.product_price }원</h2>
                    <table border="1">
                        <tr>
                            <th>금액</th>
                            <td><input type="number" name="pirce" readonly style="border:none" value="${data.product_price }">원</td>
                            <th>흥정 여부</th>
                            <td><input type="text" name="product_status1" readonly style="border:none" value="${data.product_status1 }"></td>
                           
                        </tr>
                        <tr>
                            <th>상품 상태</th>
                            <td><input type="text" name="product_status" readonly style="border:none" value="${data.product_status }"></td>
                        </tr>
                        <tr>
                            <th>거래 방법</th>
                            <td><input type="text" name="trade" readonly style="border:none" value="${data.product_trade}"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
			<textarea id="content" name="content" rows="10" cols="110" readonly placeholder="상품 내용을 입력하세요">${data.product_main }</textarea>
			<br>
			<c:choose>
				<c:when test="${not empty loginAdmin }">
					<input type="button" 
					       value="수정" onclick="location.href='${contextPath}/board/modifyForm?product_no=${data.product_no }'">
					<input type="button" 
				           value="삭제" onclick="location.href='${contextPath}/board/delete?product_no=${data.product_no }&product_img=${data.product_img }'">
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${empty loginAdmin }">
					<c:if test="${data.product_writer==loginUser}">
						<input type="button" 
						       value="수정" onclick="location.href='${contextPath}/board/modifyForm?product_no=${data.product_no }'">
						<input type="button" 
					           value="삭제" onclick="location.href='${contextPath}/board/delete?product_no=${data.product_no }&product_img=${data.product_img }'">
					</c:if>
				</c:when>
			</c:choose>
			<input type="button" value="글목록" onclick="location.href='${contextPath}/board/boardAllList'">
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>