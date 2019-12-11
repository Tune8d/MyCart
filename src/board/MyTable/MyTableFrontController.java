	package board.MyTable;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.member.UserMemberLoginAction;

@WebServlet("*.tb")
public class MyTableFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyTableFrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionTB(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void actionTB(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = null;
		command = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("userCommand:" + command);

		ActionForward forward = null;
		Action action = null;

		if (command.equals("/write.tb")) {
			System.out.println("신규회원...");
			action = new MyTableWriteAction();
			forward = action.execute(request, response);
		} else if (command.equals("/bring.tb")) {
			System.out.println("기존회원...");
			action = new MyTableReadAction();
			forward = action.execute(request, response);
		}

	      if(forward != null) {
	          RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
	          rd.forward(request, response);
	      }
	}
}
