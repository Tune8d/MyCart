package user.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.db.UserDAO;

public class UserMemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		UserDAO userDAO = new UserDAO();

		String id = request.getParameter("userID");
		String pw = request.getParameter("userPassword");

		int result = userDAO.logIn(id, pw);

		if (result == 1) {
			session.setAttribute("userID", id);
			// admin 용
			/* if(false) { id = (String) session.getAttribute("id"); } else */
			forward.setRedirect(true);
			forward.setPath("/myCartMain.go");
			return forward;
		} 
		if (result == 0) {
			response.setContentType("text/html; charset=utf-8");// 안해주면 깨진다
			PrintWriter script = response.getWriter();
			script.println("<script>");
			// 서블릿에서 js 사용을 위해 작은따옴표를 사용가능하게 한 것인가.
			script.println("alert('비밀번호가 틀렸습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else if (result == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다..');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else if (result == -2) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('UNKNOWN ERROR');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}	else if (id != null) {
			response.setContentType("text/html; charset=utf-8");// 안해주면 깨진다
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다!');");
			script.println("</script>");
			script.close();
			forward.setRedirect(true);
			forward.setPath("./myCart.go");
			return forward;
		}

		return null;
	}

}
