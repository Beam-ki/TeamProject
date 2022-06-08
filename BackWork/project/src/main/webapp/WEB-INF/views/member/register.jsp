<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/register</title>
<!--
Daum(카카오) 우편번호 API 
https://postcode.map.daum.net/guide#usage
-->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function daumPost(){
	new daum.Postcode({
		oncomplete:function(data){
			// 도로명일 경우 R, 지번일 경우 J의 값을 가지고 있음
			var addr=""
			if(data.userSelectedType=="R"){
				addr=data.roadAddress
			}else{
				addr=data.jibunAddress
			}
			$("#addr1").val(data.zonecode)
			$("#addr2").val(addr)
			$("#addr3").focus()
		}
	}).open();
}

function register(){
	addr1=$("#addr1").val()
	addr2=$("#addr2").val()
	addr3=$("#addr3").val()
	addr1=addr1+"/"+addr2+"/"+addr3
	$("#addr1").val(addr1)
	fo.submit()
}
</script>
<style>
.wrap{
	width:600px;
	display:flex;
	justify-content:center;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1 align="center">회원 가입</h1>
	<div class="wrap">
		<form id="fo" action="register" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id" maxlength="10"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw" name="pw"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
<!-- 						<input type="text" id="addr" name="addr"><br> -->
						<input type="text" id="addr1" name="addr" placeholder="우편번호" readonly>
						<input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
						<input type="text" id="addr2" placeholder="주소" readonly><br>
						<input type="text" id="addr3" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
<!-- 						<input type="submit" value="회원가입"> -->
						<input type="button" onclick="register()" value="회원가입">
					</td>
				</tr>
			</table>
		</form>	
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>