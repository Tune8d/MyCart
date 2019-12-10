package board.MyTable;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.tb")
public class MyTableFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyTableFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionMT(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void actionMT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		
		String command = null;
		command = request.getRequestURI().substring(request.getContextPath().length());
		
		System.out.println("userCommand:" + command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/write.tb")) {
			action = new MyTableWriteAction();
			System.out.println("테이블컨트롤러..");
			forward = action.execute(request, response);
		} else if(command.equals("/bring.tb")) {
			action = new MyTableReadAction();
			forward = action.execute(request, response);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
		rd.forward(request, response);
	}
}
