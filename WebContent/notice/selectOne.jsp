<%@page import="com.hanul.file.FileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h1>title : <%= %></h1>
		<h1>content : <%= %></h1>
		<h1>writer : <%= %></h1>
		
		<% for(FileDTO file : ar){ %>
			<h3> <a href="../upload/<%=file.getFname()%>"><%=file.getOname() %></a></h3>
		<%} %>
		
	</div>


</body>
</html>