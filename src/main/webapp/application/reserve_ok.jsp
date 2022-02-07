<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] seat = request.getParameterValues("seat");

	//list생성(좌석정보를 저장할)
	ArrayList<String> list = new ArrayList<>();
	
	//만약 app에 예약된 정보가 있다면 좌석정보를 가져온다.
	if(application.getAttribute("list") != null ) {
		list = (ArrayList<String>)application.getAttribute("list");
	}

	//seat과 list를 비교
	ArrayList<String> temp = new ArrayList<>(); //임시저장할 사본리스트	
	for(String s : seat) {
		if(list.contains(s) ) { //포함되어잇다면 true
			break;
		} else { //포함되지 않은경우
			temp.add(s);
		}
	}
	
	//중복이 없다는 것은? seat길이와 temp길이가 같다.
	if(seat.length == temp.size() ) {
		list.addAll(temp); //사본리스트를 전부추가
	}
	
	//최종적으로 app에 list를 저장
	application.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<h3>선택한 좌석</h3>
		<% for(String s : seat) { %>
			<b>[<%=s %>]</b>
		<% } %>
		
		<br>
		<h3>신청결과</h3>
		<%=seat.length == temp.size() ? "<b>성공</b>" : "<b>실패</b>"  %>
		
		<br>
		<a href="reserve.jsp">다시 예약하기</a>
	</div>
	
</body>
</html>



