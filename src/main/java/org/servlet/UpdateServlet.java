package org.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.todo.Note;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId = Integer.parseInt(request.getParameter("noteId"));
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			Note n = s.get(Note.class, noteId);
			
			n.setTitle(title);
			n.setContent(content);
			n.setAddedDate(new Date());
			
			t.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
