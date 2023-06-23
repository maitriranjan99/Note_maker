<%@page import="org.todo.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>

		<div class="row">

			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query qry = s.createQuery("select n from Note n");

				List<Note> notes = qry.getResultList();

				for (Note n : notes) {
				%>
				<div class="card mt-3">
					<img src="image/notepad.png" style="max-width: 100px"
						class="card-img-top mx-auto" alt="...">
					<div class="card-body px-5">
						<h5 class="card-title"><%=n.getTitle()%></h5>
						<p class="card-text"><%=n.getContent()%></p>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%=n.getId()%>"
								class="btn btn-danger">Delete</a> 
								<a href="update.jsp?note_id=<%=n.getId()%>" 
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>
				<%
				}
				s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>