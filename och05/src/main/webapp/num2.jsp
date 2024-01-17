<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function init() {
		frm.num1.value = "100";
		frm.num2.value = "5";
		frm.num1.focus();
	}
</script>
</head>
<body onload="init()">
	<h2>연산할 숫자 입력 jsp이용한 Error 처리</h2>
	<!-- <form action="cal1.jsp" name="frm">
	<form action="cal2.jsp" name="frm">
	<form action="cal3.jsp" name="frm">
	<form action="cal4.jsp" name="frm"> -->
	<form action="cal5.jsp" name="frm">
		첫번째 숫자 : <input type="text" name="num1"><p>
		두번째 숫자 : <input type="text" name="num2"><p>
		<input type="submit" value="확인">
	</form>
</body>
</html>