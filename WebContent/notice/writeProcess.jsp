<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	
	// 단위는 byte. 
	int max = 1024*1024*10;

	// 저장할 path는 이렇게 지정하는게 안전
	String path = request.getServletContext().getRealPath("upload");
	System.out.println(path);
	
	try{
	MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
	//파일의 정보
	String fName = multi.getFilesystemName("f1");//매개변수로 parameter의 이름
	String oName = multi.getOriginalFileName("f1");
	File f = multi.getFile("f1");
	Enumeration e = multi.getFileNames(); //parameter names 반환
	
	
	System.out.println(fName);
	System.out.println(oName);
	} catch(Exception e){
		
	}	
	// MultipartRequest객체가 성공적으로 만들어지면 path 경로에 file upload가 완료됨. 
	
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var r = "upload 성공";
	alert(r);
	location.href = "../index.jsp";
</script>
</head>
<body>

</body>
</html>