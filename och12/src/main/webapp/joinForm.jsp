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
	/* 	새로 열릴 참의 속성 또는 창의 이름을 지정(target="_blank") 
    선택적인 값으로 기본값은 "_blank" . 사용 가능한 값을 다음과 같습니다.
	- _blank : 새 창에 열립니다. 이것이 기본값입니다.
	- _parent : 부모 프레임에 열립니다.
	- _self : 현재 페이지를 대체합니다.
	- _top : 로드된 프레임셋을 대체합니다.
	- name(임의의 이름) : 새 창이 열리고 창의 이름을 지정합니다. 동일한 이름에 다시 open() 을 하면 기존의 열린창의 내용이 바뀝니다. 
	              다른 이름을 사용하면 또다른 새창이 열립니다
	              
	  var popup = window.open(url, name, option);
	  var popup = window.open('팝업주소', '팝업창 이름', '팝업창 설정');
    */
	function winop(){
		if(!frm.id.value){
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		}
		window.open("confirmId.jsp?id="+frm.id.value,"kkk","width=300 height=300");
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