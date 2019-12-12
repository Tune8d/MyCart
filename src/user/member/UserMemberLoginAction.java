package user.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;
import user.db.UserDAO;

public class UserMemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		UserDAO userDAO = new UserDAO();
		BoardDAO boardDAO = new BoardDAO();

		String id = request.getParameter("userID");
		String pw = request.getParameter("userPassword");

		int result = userDAO.logIn(id, pw);
		//boolean resultOld = boardDAO.userIsOld(id);
		
		if (result == 1) {
			session.setAttribute("userID", id);
			forward.setRedirect(true);
			forward.setPath("boardWrite.jsp");
			return forward;
			/*
			 * if(resultOld == false) { forward.setRedirect(true);
			 * forward.setPath("boardWrite.jsp"); return forward; }else if(resultOld ==
			 * true) { forward.setRedirect(true); forward.setPath("/bring.tb"); return
			 * forward; }
			 */	
			} else if (result == 0) {
			response.setContentType("text/html; charset=utf-8");// 안해주면 깨진다
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else if (result == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다..');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else if (result == -2) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('UNKNOWN ERROR');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else if (id != null) {
			response.setContentType("text/html; charset=utf-8");// 안해주면 깨진다
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 로그인이 되어있습니다!');");
			out.println("</script>");
			out.close();
			forward.setRedirect(true);
			forward.setPath("/myCart.go");
		}

		return forward;
	}

}
