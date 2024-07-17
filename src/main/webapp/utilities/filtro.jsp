<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%	HttpSession sessione = request.getSession();
		if(sessione.getAttribute("id")==null){
			response.sendRedirect("./login.jsp");
		}
	%>
</body>
</html>