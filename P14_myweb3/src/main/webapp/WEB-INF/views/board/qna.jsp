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
    <title>문의 게시판</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
	<!-- container -->
    <div class="container">
    	<!-- nav -->
        <c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header>
            <h1>안쓰는 물건 사고팔땐, <span>중고</span>마켓</h1>
        </header>
        <!-- section -->
        <section>
            <h2>문의게시판 🙌</h2>
            <div class="notice">
                <div class="btn ico-notice">공지</div>
                <a href="qnaNotice">문의게시판 공지사항</a>
            </div>
        <table border="1">
			<tr align = "center" bgcolor="#F2F2F2">
				<td>No.</td>
				<td width="50%">제목</td>
				<td>작성자</td>
				<td>등록일</td>		
			</tr>
			<c:forEach var="dto" items="${qna }">
			<tr>				
				<td>${dto.product_no }</td>
				<td><a href="${contextPath }/board/qnacontentView?product_no=${dto.product_no}">${dto.product_title }</a></td>
				<td>${dto.product_writer }</td>				
				<td>
					<fmt:parseDate value="${dto.product_day}" var="product_day" pattern="yyyy-MM-dd HH:mm:ss" />	
					<fmt:formatDate value="${product_day}" pattern="yyyy-MM-dd"/>
				</td>
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
                                                                                          
             <a href="/root/board/qnawriteForm" class="btn btn-submit">글쓰기</a>
        </section>
    </div>  
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>