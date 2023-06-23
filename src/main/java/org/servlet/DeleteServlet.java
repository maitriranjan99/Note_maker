package org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.todo.Note;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id"));
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			
			Note n = (Note)s.get(Note.class, noteId);
			s.delete(n);
			t.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
