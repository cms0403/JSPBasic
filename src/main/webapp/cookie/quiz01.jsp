<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	Date클래스를 이용해서 이 페이지에 접근한시간을 xxxx년xx월xx일 형태로 생성
	show라는 이름으로 쿠키를 생성
	quiz01_ok.jsp에 넘어가서 이 쿠키를 화면에 출력. (만약 쿠키가없다면 출력하지 않아도됩니다)
	
	*/
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");	
	String now = sdf.format(date);
	
	//쿠키생성(이름, 값)
	Cookie cookie = new Cookie("show", now);
	cookie.setMaxAge(1800);//30분
	response.addCookie(cookie);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="quiz01_ok.jsp">쿠키값확인</a>
	
	
</body>
</html>