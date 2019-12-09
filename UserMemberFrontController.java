package user.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.go")
public class UserMemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserMemberFrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionGo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void actionGo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = null;
		command = request.getRequestURI().substring(request.getContextPath().length());

		System.out.println("userCommand:" + command);

		ActionForward forward = null;
		Action action = null; // 즉 DAO 로 보내질 요청에 탑재할 변수

		if (command.equals("/myCart.go")) {
			forward = new ActionForward();
			forward.setPath("main.jsp");
		} else if (command.equals("/myCartMain.go")) {
			forward = new ActionForward();
			forward.setPath("main.jsp");
		} else if (command.equals("/loginAction.go")) {
			action = new UserMemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/joinAction.go")) {
			action = new UserMemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/idFindAction.go")) {
			action = new idFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
		RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
		rd.forward(request, response);
			}		
		}
	}
}
