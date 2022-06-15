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
    <title>팝니다🙌</title>
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
            <h2>팝니다🙌</h2>
            <div class="notice">
                <div class="btn ico-notice">공지</div>
                <a href="#">팝니다🙌 게시판 이용 방법</a>
            </div>    
            <c:if test="${boardList.size()==0 }">
				<tr>
					<th>등록된 글이 없습니다</th>
				</tr>
			</c:if>
			
			<c:set var="i" value="0"/>
			<c:set var="j" value="4"/>
			<table>
				<c:forEach var="dto" items="${boardList }">
				<input type="hidden" name="type" value="A">
					<c:if test="{i%j==0}">
					<tr>
					</c:if>
						<td>
							<div class="pro-thumbnail">
		                    	<a href="${contextPath }/board/contentView?product_no=${dto.product_no}">
		                    		<img src="${contextPath }/board/download?file=${dto.product_img }" width="100px" height="100px">
		                    	</a>
	                    	</div>
	                    	<p class="pro-title">
	                    		<a href="${contextPath }/board/contentView?product_no=${dto.product_no}">${dto.product_title }</a>
	                   		</p>
						</td>
					<c:if test="${i%j==j-1}">
					<tr>
					</c:if>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>	
			</table>
			
            <table>
            	<tr>
					<td colspan="6" align="center">
						<c:forEach var="num" begin="1" end="${repeat }">
							<a href="boardAllList?num=${num }">[ ${num } ]</a>
						</c:forEach>
					</td>
				</tr>
            </table>
			<a href="/root/board/writeForm" class="btn btn-submit">글쓰기</a>
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>