<%@page import="maven_example.TodoDto"%>
<%@page import="maven_example.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("what");
		String name = request.getParameter("who");
		String sequence = request.getParameter("rank");
		
		System.out.println("제목 : "+title+" 작성자 : "+name +"우선순위 : "+sequence);
		
		TodoDto dbDto = new TodoDto();
		dbDto.setTitle(title);
		dbDto.setName(name);
		dbDto.setSequence(Integer.parseInt(sequence));
		
		TodoDao manager = TodoDao.getInstance();
		manager.addTodo(dbDto);
		
	%>
	<%-- 메인페이지로 이동 --%>
	<script>
		alert("일정 등록 성공");
		location.href="index.jsp";
	</script>
	
	
</body>
</html>