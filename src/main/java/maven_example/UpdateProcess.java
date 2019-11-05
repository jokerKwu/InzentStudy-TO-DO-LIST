package maven_example;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProcess
 */
@WebServlet("/UpdateProcess")
public class UpdateProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProcess() {
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
		//doGet(request, response);
		
		
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");


		
		TodoDto dto = new TodoDto();
		dto.setId(Long.parseLong(request.getParameter("id")));
		dto.setName(request.getParameter("name"));
		dto.setRegDate(request.getParameter("regDate"));
		dto.setSequence(Integer.parseInt(request.getParameter("sequence")));
		dto.setTitle(request.getParameter("title"));
		dto.setType(request.getParameter("type"));
		
		System.out.println("작성자 : "+dto.getName());
		
		
		TodoDao manager = TodoDao.getInstance();
		manager.updateTodo(dto);

		response.sendRedirect("index.jsp");

        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        //requestDispatcher.forward(request, response);
		
	}

}
