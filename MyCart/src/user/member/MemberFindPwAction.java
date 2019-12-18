package user.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.db.UserDAO;
import user.db.UserDTO;

public class MemberFindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		String id = request.getParameter("MEMBER_ID");
		String email = request.getParameter("email");
		
		dto = dao.FindPw(id, email);
		
		if(dto != null) {
			request.setAttribute("userID", dto.getUserID());
			request.setAttribute("userPassword", dto.getUserPassword());
			forward.setRedirect(false);
			forward.setPath("/findpwOk.jsp");
		}else {
			response.setContentType("text/html' charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력한 정보가 일치하지 않습니다');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			forward=null;
		}	
		return forward;

	}
}
