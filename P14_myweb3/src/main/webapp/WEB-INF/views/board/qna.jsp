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
    <title>문의하기</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
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
        <!-- section -->
        <section>
            <h1>문의 게시판</h1>
            <p>도움이 필요하신가요? 자유롭게 문의글을 남겨주세요!</p>
			
			<table border="1">
				<tr>
					<td>번호</td>
                    <td class="t-title">제목</td>
                    <td>글쓴이</td>
                    <td>날짜</td>
				</tr>
				<c:if test="${qnaList.size()==0 }">
					<tr>
						<th colspan="4">등록된 글이 없습니다</th>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${qnaList }">
					<tr>
						<td>${dto.writeNo }</td>
						<td><a href="#">${dto.title }</a></td>
						<td>${dto.id }</td>
						<td>${dto.saveDate }</td>
					</tr>
				</c:forEach>
				<tr>
				<td colspan="4"><a href="${contextPath }/board/writeForm">글작성</a></td>
			</tr>
			</table>	
			<br>
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="qna?num=${num }">[ ${num } ]</a>
			</c:forEach>
		
			
		
<!--             <ul class="paging"> -->
<!--                 <a href="javascript:;"><li>&lt;</li></a> -->
<!--                 <a href="javascript:;"><li>1</li></a> -->
<!--                 <a href="javascript:;"><li>2</li></a> -->
<!--                 <a href="javascript:;"><li>3</li></a> -->
<!--                 <a href="javascript:;"><li>4</li></a> -->
<!--                 <a href="javascript:;"><li>5</li></a> -->
<!--                 <a href="javascript:;"><li>&gt;</li></a> -->
<!--             </ul> -->
        </section>
    </div>
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