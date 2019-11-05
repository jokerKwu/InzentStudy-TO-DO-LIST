<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title>jsp 게시판 웹사이트</title>

</head>

<body>
	<div id="contents" align="center">
		<h1> 할일 등록 </h1>
		<form action="WriteProcess" method="post">
			<div class="section">
				<span>어떤일인가요?</span><br>
				<input type="text" name="what">
			</div>
			
			<div class="section">
				<span>누가 할일인가요?</span><br>
				<input type="text" name="who">
			</div>
			
			<div class="section">
				<span>우선순위를 선택하세요</span><br>
				<input type="radio" name="rank"  value="1"/> 1순위
				<input type="radio" name="rank"  value="2"/> 2순위
				<input type="radio" name="rank"  value="3"/> 3순위
				
			</div>
				<input type="submit" class="btnBox" value="제출">
				<input type="reset" class="btnBox" value="내용지우기">

			
		</form>
				<button onclick="location='index.jsp'">이전</button> 	
	</div>



</body>

</html>
