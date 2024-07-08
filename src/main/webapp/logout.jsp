<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

Cookie[] cookar=request.getCookies();
for(Cookie c:cookar){
	if(c.getName().equals("uname")){
		if(c.getValue().equals(session.getAttribute("na"))){
			c.setMaxAge(0);
			response.addCookie(c);
			response.sendRedirect("index.jsp");
		}
	}
}
session.invalidate();

%>
</body>
</html>