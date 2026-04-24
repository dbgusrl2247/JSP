<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로케일 테스트</title>
</head>
<body>
	<p> ----------기본 로케일----------- </p>
	<fmt:setBundle basename="ch09.com.bundle.myBundle" var="resourceBundle" />
	<p> 제목 : <fmt:message key="title" bundle="${resourceBundle}" /> </p>
	
	<fmt:message key="username" var="userMsg" bundle="${resourceBundle}" />
	<p> 이름 : ${userMsg} </p>
		
		
	<p> ---------영문 로케일-------------- </p>
	<fmt:setLocale value="en" />
	<fmt:setBundle basename="ch09.com.bundle.myBundle" var="resourceBundle" />
	<p> 제목 : <fmt:message key="title" bundle="${resourceBundle}" /> </p>
	
	<fmt:message key="username" var="userMsg_en" bundle="${resourceBundle}" />
	<p> 이름 : ${userMsg_en} </p>
	
</body>
</html>