<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contentView</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="content_view" align="center">
		<br>
		<table border="1">
			<tr>
				<td width="100px">글번호</td><td width="200px">${data.writeNo }</td>
				<td width="100px">작성자</td><td width="200px">${data.id }</td>
			</tr>
			<tr>
				<td width="100px">제목</td><td width="200px">${data.title }</td>
				<td width="100px">작성일</td><td width="200px">${data.saveDate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${data.content }</td>
				<td colspan="2">
					<c:if test="${data.imageFileName=='nan' }">
						<b>이미지가 없습니다</b>
					</c:if>
					<c:if test="${data.imageFileName!='nan' }">
						<img src="${contextPath }/board/download?imageFileName=${data.imageFileName }" width="200px" height="200px">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<c:if test="${data.id==loginUser }">
						<input type="button" 
						       value="수정" onclick="location.href='${contextPath}/board/modify_form?writeNo=${data.writeNo }'">
						<input type="button" 
					           value="삭제" onclick="location.href='${contextPath}/board/delete?writeNo=${data.writeNo }&imageFileName=${data.imageFileName }'">
					</c:if>
					<input type="button" value="글목록" onclick="location.href='${contextPath}/board/boardAllList'">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>