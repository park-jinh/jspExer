<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table {background-color: pink;}
</style>
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 다릅니다");
			frm.passwd.focus();
			return false;
		}
		return true;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="joinPro.jsp" name="frm" onsubmit="return chk()">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required="required">
					<input type="button" value="아이디체크" onclick="winop()"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="passwd" required="required"></td>
			</tr>
			<tr>
				<td>암호확인</td>
				<td><input type="password" name="passwd2" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" required="required"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="tel" required="required"
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>