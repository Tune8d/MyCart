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
			System.out.println("첫 로그인");
			action = new MyTableWriteAction();
			forward = action.execute(request, response);
		} else if (command.equals("/bring.tb")) {
			System.out.println("첫 추가");
			action = new MyTableReadAction();
			forward = action.execute(request, response);
		} else if (command.equals("/check.tb")) {
			System.out.println("첫 확인");
			action = new MyTableCheckAction();
			forward = action.execute(request, response);
		} else if (command.equals("/delete.tb")) {
			System.out.println("삭제하기");
			action = new MyTableDeleteAction();
			forward = action.execute(request, response);
		}else if (command.equals("/update.tb")) {
			System.out.println("수정하기");
			action = new MyTableUpdateViewAction();
			forward = action.execute(request, response);
		}else if (command.equals("/updateAction.tb")) {
			System.out.println("수정하기");
			action = new MyTableUpdateAction();
			forward = action.execute(request, response);
		}else if (command.equals("/view.tb")) {
			System.out.println("상세보기");
			action = new MyTableViewerAction();
			forward = action.execute(request, response);
		}

	      if(forward != null) {
	          RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
	          rd.forward(request, response);
	      }
	}
}
