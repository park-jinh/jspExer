<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Bean Java Bean은 특정 형태의 클래스 -->
	<!-- 1. 필드는 private로 구성  -->
  	<!-- 2. getter와 setter를 통해서만 접근  -->
  	<!-- 3. 전달 인자가 없는( no-argument)  생성자로 구성  -->
	<!-- Bean 선언 -->
	<jsp:useBean id="pt" class="och08.Book" scope="request" />
	<!-- Bean 값 저장 -->
	<jsp:setProperty property="*" name="pt" />
	
	<!-- Bean 값 가져오기 -->
	코드: <jsp:getProperty property="code" name="pt" /><p>
	이름: <jsp:getProperty property="name" name="pt" /><p>
	가격: <jsp:getProperty property="price" name="pt" /><p>
	
	<!-- Bean Page 이동 -->
	<jsp:forward page="productInfo.jsp" />
	
</body>
</html>