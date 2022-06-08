<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardAllList</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<br>
		<h3 align="center">게시판</h3>
		<br>
		<table class="table table-hover" border="1">
			<tr>
				<th width="100px">번호</th>
				<th width="150px">아이디</th>
				<th width="200px">제목</th>
				<th width="200px">날짜</th>
				<th width="100px">조회수</th>
				<th width="100px">이미지 이름</th>
			</tr>
			<c:if test="${boardList.size()==0 }">
				<tr>
					<th colspan="6">등록된 글이 없습니다</th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${boardList }">
				<tr>
					<td>${dto.writeNo }</td>
					<td>${dto.id }</td>
					<td><a href="${contextPath }/board/contentView?writeNo=${dto.writeNo}">${dto.title }</a></td>
					<td>${dto.saveDate }</td>
					<td>${dto.hit }</td>
					<td>${dto.imageFileName }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center">
					<c:forEach var="num" begin="1" end="${repeat }">
						<a href="boardAllList?num=${num }">[ ${num } ]</a>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="6"><a href="${contextPath }/board/writeForm">글작성</a></td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>