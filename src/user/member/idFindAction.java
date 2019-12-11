package user.member;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.db.UserDAO;
import user.db.UserDTO;

public class idFindAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{	
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		UserDAO userdao = new UserDAO();
		UserDTO member = new UserDTO();

		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		//System.out.println("이름은 "+ name);
		//System.out.println("이메일은 "+ email);
		member = userdao.findId(name, email);
		//System.out.println("이름과 이메일: " + member);
	
		if (member != null) {
			request.setAttribute("userID", member.getUserID());
			forward.setRedirect(false);
			forward.setPath("./idFind_ok.jsp");

		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력한 정보가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			forward = null;
		}
		return forward;
	}
}
