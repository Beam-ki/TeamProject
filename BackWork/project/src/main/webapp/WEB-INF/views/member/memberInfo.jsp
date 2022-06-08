<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberInfo</title>
<style>
.member_table{
	margin:0 auto;
	width:700px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<br>
		<h1 align="center">회원 목록</h1>
		<table class="member_table" border="1">
			<tr>
				<th>아이디</th><th>비밀번호</th><th>주소</th>
			</tr>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td><a href="info?id=${member.id }">${member.id }</a></td><td>********</td><td>${member.addr }</td>
				</tr>
			</c:forEach>
		</table>	
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>