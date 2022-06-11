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
        <nav>
            <ul class="gnb-lnb">
                <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
                <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li>
                <li class="left-nav"><a href="/root/board/qna">문의하기</a></li>
            </ul>
        </nav>
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
			<c:forEach var="dto" items="${boardList }">
				<div class="product-board">
	                <div class="product">
	                    <div class="pro-thumbnail"><a href="${contextPath }/board/contentView?writeNo=${dto.writeNo}">${dto.imageFileName }</a></div>
	                    <p class="pro-title">${dto.writeNo }(테스트용)<a href="#">${dto.title }</a></p>
	                </div>
	            </div>
			</c:forEach>
            <table>
            	<tr>
					<td colspan="6" align="center">
						<c:forEach var="num" begin="1" end="${repeat }">
							<a href="boardAllList?num=${num }">[ ${num } ]</a>
						</c:forEach>
					</td>
				</tr>
            </table>
        </section>
    </div>
    <!-- footer -->
    <footer>
        <div class="container">
            <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="../img/icon-github.png" alt="" class="ico-github"></a>
            <div class="text">
                <p>안범기 유동준 이승정 이덕현</p>
                <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>