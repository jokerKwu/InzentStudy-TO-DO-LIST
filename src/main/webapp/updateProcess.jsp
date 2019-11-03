<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="maven_example.TodoDto"%>
<%@page import="maven_example.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		TodoDto dto = new TodoDto();
		dto.setId(Long.parseLong(request.getParameter("id")));
		dto.setName(request.getParameter("name"));
		dto.setRegDate(request.getParameter("regDate"));
		dto.setSequence(Integer.parseInt(request.getParameter("sequence")));
		dto.setTitle(request.getParameter("title"));
		dto.setType(request.getParameter("type"));
		
		TodoDao manager = TodoDao.getInstance();
		manager.updateTodo(dto);
		
		
	%>
	
	<%-- 메인페이지로 이동 --%>
	<script>
		alert("이동 성공");
		location.href="index.jsp";
	</script>
</body>
</html>