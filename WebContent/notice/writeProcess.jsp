<%@page import="com.hanul.file.FileDAO"%>
<%@page import="com.hanul.notice.NoticeDTO"%>
<%@page import="com.hanul.notice.NoticeDAO"%>
<%@page import="com.hanul.file.FileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	MultipartRequest multi = null;	
	String path = null;
	// 단위는 byte. 
	int max = 1024*1024*10;

	// 저장할 path는 이렇게 지정하는게 안전
	
	path = request.getServletContext().getRealPath("upload");
	System.out.println(path);
	
	
	multi = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
	// MultipartRequest객체가 성공적으로 만들어지면 path 경로에 file upload가 완료됨. 

	//파일의 정보
	String fName = multi.getFilesystemName("f1");//매개변수로 parameter의 이름
	String oName = multi.getOriginalFileName("f1");
	
	String fName2 = multi.getFilesystemName("f2");
	String oName2 = multi.getOriginalFileName("f2");
	
	//File f = multi.getFile("f1");
	//Enumeration e = multi.getFileNames(); //parameter names 반환
	
	
	//System.out.println(fName);
	//System.out.println(oName);
	
	NoticeDTO nDto = new NoticeDTO();
	nDto.setSubject(request.getParameter("subject"));
	nDto.setContent(request.getParameter("content"));
	nDto.setWriter(request.getParameter("writer"));

	NoticeDAO nDao = new NoticeDAO();
	int num = nDao.getNo();
	
	nDto.setNo(num);
	
	int result = nDao.insert(nDto);
	
	FileDTO fileDTO1 = new FileDTO();
	FileDTO fileDTO2 = new FileDTO();
	fileDTO1.setFname(fName);
	fileDTO1.setOname(oName);
	fileDTO2.setFname(fName2);
	fileDTO2.setOname(oName2);
	fileDTO2.setKind("N");
	fileDTO2.setKind("N");
	fileDTO1.setNo(num);
	fileDTO2.setNo(num);
	
	FileDAO fileDAO = new FileDAO();
	int result1 = fileDAO.insert(fileDTO1);
	int result2 = fileDAO.insert(fileDTO2);
	
	String fResult = "업로드 실패";
	
	if(result>0 && result1>0 && result2>0){
		fResult = "업로드 성공";
	}
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	alert('<%= fResult%>');
	location.href = "../index.jsp";
</script>
</head>
<body>

</body>
</html>