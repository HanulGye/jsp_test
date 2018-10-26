<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="./writeProcess.jsp" method="post" enctype="multipart/form-data">
			<p>subject <input type="text" name="subject"></p>
			<p>content <input type="text" name="content"></p>
			<p>writer <input type="text" name="writer"></p>
			<p><input type="file" name="f1"></p>
			<p><input type="file" name="f2"></p>  
			<button>submit</button>		
		</form>
	
	</div>

</body>
</html>