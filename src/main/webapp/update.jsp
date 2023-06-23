<%@page import="org.todo.Note"%>
<%@page import="org.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit your note</h1>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));

		Session s = FactoryProvider.getFactory().openSession();
		Note n = (Note) s.get(Note.class, noteId);
		%>


		<form action="UpdateServlet" method="post">
			<input value="<%=n.getId()%>" name="noteId" type="hidden">
			<div class="mb-3">
				<label for="title" class="form-label">Note title</label> <input
					name="title" required type="text" class="form-control" id="title"
					placeholder="Enter here" aria-describedby="emailHelp"
					value="<%=n.getTitle()%>" />
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea name="content" required id="content" class="form-control"
					style="height: 300px;" placeholder="Enter your content here"><%=n.getContent()%>
				</textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your
					Note</button>
			</div>
		</form>

	</div>
</body>
</html>