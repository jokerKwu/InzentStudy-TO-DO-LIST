
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="maven_example.TodoDto"%>
<%@page import="maven_example.TodoDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta name="viewport" content="width= device-width", initial-scale="1">

<link rel="stylesheet" href="css/indexStyle.css">

<title>JSP 게시판 웹 사이트</title>

</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		List<TodoDto> list = new ArrayList<TodoDto>();
		TodoDao manager = TodoDao.getInstance();
		list = manager.getTodos();
	%>
	
	<button class="btnBox" onclick="location='write.jsp'">새로운 TODO 등록</button>
	
	<table id="main">
	<tbody>
	<td id="todo">
	<table>
		<thead>
		<tr>
			<td class="header">TODO</td>
		</tr>
		</thead>
		<tbody>
	<%
		for(int i=0;i<list.size();i++){
	%>
		
		<%-- TODO 리스트 출력 --%>
			<%
				TodoDto todoDto=list.get(i);
				String typeCheck=todoDto.getType();
				if(typeCheck.equals("TODO")){
			%>
			<tr>
			<td>
				<form action="updateProcess.jsp" method="post">
					<div class="todoBox">
						<%= todoDto.getTitle() %><br>
						<%=todoDto.getName() %>
				
					<input type="hidden" name="id" value=<%=todoDto.getId() %>>
					<input type="hidden" name="regDate" value=<%=todoDto.getRegDate() %>>
					<input type="hidden" name="sequence" value=<%=todoDto.getSequence() %>>
					<input type="hidden" name="title" value=<%=todoDto.getTitle() %>>
					<input type="hidden" name="type" value=<%=todoDto.getType() %>>
					<input type="hidden" name="name" value=<%=todoDto.getName() %>>
					<input type="submit" value="->">
					</div>
				</form>
				
			</td>
			</tr>
			<% }}%>
			
			
			</tbody>	
		</table> <%-- 내부 테이블 --%>
		
		
		<td id="doing">

	<table>
		<thead>
		<tr>
			<td class="header">DOING</td>
		</tr>
		</thead>
		<tbody>
	<%
		for(int i=0;i<list.size();i++){
	%>
		
		<%-- TODO 리스트 출력 --%>
			<%
				TodoDto todoDto=list.get(i);
				String typeCheck=todoDto.getType();
				if(typeCheck.equals("DOING")){
			%>
			<tr>
			<td>
				<form action="updateProcess.jsp" method="post">
					<div class="doingBox">
						<%= todoDto.getTitle() %><br>
						<%=todoDto.getName() %>
					
					<input type="hidden" name="id" value=<%=todoDto.getId() %>>
					<input type="hidden" name="regDate" value=<%=todoDto.getRegDate() %>>
					<input type="hidden" name="sequence" value=<%=todoDto.getSequence() %>>
					<input type="hidden" name="title" value=<%=todoDto.getTitle() %>>
					<input type="hidden" name="type" value=<%=todoDto.getType() %>>
					<input type="hidden" name="name" value=<%=todoDto.getName() %>>
					<input type="submit" value="->">
				</form>
				</div>
			</td>
			</tr>
			<% }}%>
			
			
			</tbody>	
		</table> <%-- 내부 테이블 --%>


		</td>
		
		
		
		<td id="done">
		
			<table>
		<thead>
		<tr>
			<td class="header">DONE</td>
		</tr>
		</thead>
		<tbody>
	<%
		for(int i=0;i<list.size();i++){
	%>
		
		<%-- TODO 리스트 출력 --%>
			<%
				TodoDto todoDto=list.get(i);
				String typeCheck=todoDto.getType();
				if(typeCheck.equals("DONE")){
			%>
			<tr>
			<td>
				<form action="updateProcess.jsp" method="post">
					<div class="doneBox">
						<%= todoDto.getTitle() %><br>
						<%=todoDto.getName() %>
					
					<input type="hidden" name="id" value=<%=todoDto.getId() %>>
					<input type="hidden" name="regDate" value=<%=todoDto.getRegDate() %>>
					<input type="hidden" name="sequence" value=<%=todoDto.getSequence() %>>
					<input type="hidden" name="title" value=<%=todoDto.getTitle() %>>
					<input type="hidden" name="type" value=<%=todoDto.getType() %>>
					<input type="hidden" name="name" value=<%=todoDto.getName() %>>

				</form>
				</div>
			</td>
			</tr>
			<% }}%>
			
			
			</tbody>	
		</table> <%-- 내부 테이블 --%>
		
		
		</td>
		</tbody>
		</table><%--메인 테이블 --%>

</body>

</html> 