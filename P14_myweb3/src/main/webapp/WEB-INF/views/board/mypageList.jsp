<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- nav -->
        <c:import url="../default/nav.jsp"/>
        <!-- section -->
        <section>
            <h2>마이페이지</h2>
            <div class="mypage">
                <div class="mypage-nav">
                    <ul class="mypage-rnb">
                        <li><a href="info?id=${member.id }">내 정보 수정</a></li>
                        <li><a href="mypageList?id=${member.id }">내가 쓴 글</a></li>
                        <li><a href="memberDelete?id=${member.id }">회원 탈퇴</a></li>
                    </ul>
                </div>
                <div class="mypage-con">
                <table border="1">
			<tr align = "center" bgcolor="#F2F2F2">
				<td>No.</td>
				<td width="50%">제목</td>
				<td>게시판명</td>
				<td>등록일</td>		
			</tr>
			<c:forEach var="dto" items="${mypageList }">
			<tr>				
				<td>${dto.product_no }</td>
				<td><a href="${contextPath }/board/qnacontentView?product_no=${dto.product_no}">${dto.product_title }</a></td>
				<td>${dto.product_writer }</td>				
				<td>
				<fmt:parseDate value="${dto.product_day}" var="product_day" pattern="yyyy-MM-dd HH:mm:ss" />	
				<fmt:formatDate value="${product_day}" pattern="yyyy-MM-dd"/></td>
			
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center">
					<c:forEach var="num" begin="1" end="${repeat }">
						<a href="qna?num=${num }">[ ${num } ]</a>
					</c:forEach>
				</td>
			</tr>	
		</table>
                    
                </div>
            </div>
            
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>