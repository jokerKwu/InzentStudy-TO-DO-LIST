package maven_example;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WriteProcess
 */
@WebServlet("/WriteProcess")
public class WriteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

		String title = request.getParameter("what");
		String name = request.getParameter("who");
		String sequence = request.getParameter("rank");
		

		TodoDto dbDto = new TodoDto();
		dbDto.setTitle(title);
		dbDto.setName(name);
		dbDto.setSequence(Integer.parseInt(sequence));
		
		TodoDao manager = TodoDao.getInstance();
		manager.addTodo(dbDto);
		
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
       // requestDispatcher.forward(request, response);
		response.sendRedirect("index.jsp");

	}

}
