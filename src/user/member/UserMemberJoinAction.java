package user.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.db.UserDAO;
import user.db.UserDTO;

public class UserMemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserDAO userDAO = new UserDAO();
		UserDTO userDTO = new UserDTO();
		ActionForward forward = new ActionForward();
		
		String col1 = request.getParameter("userID");
		String col2 = request.getParameter("userPassword");
		String col3 = request.getParameter("userName");
		String col4 = request.getParameter("userGender");
		String col5 = request.getParameter("userEmail");
		
		userDTO.setUserID(col1);
		userDTO.setUserPassword(col2);
		userDTO.setUserName(col3);
		userDTO.setUserGender(col4);
		userDTO.setUserEmail(col5);
		userDTO.setUserAdmin(0);
		//TimeStamp 는 Date 객체의 wrapper 
		userDTO.setUserJoinDate(new Timestamp(System.currentTimeMillis()));		
		
		//insert 를 위한 DTO 준비
		//userDAO.join(userDTO);
		
		//회원가입내역 공백 배제 -> required tag 사용
		/*
		 * if(col1 == null || col2 == null || col3 == null || col4 == null || col5 ==
		 * null) { response.setContentType("text/html; charset=utf-8"); PrintWriter out
		 * = response.getWriter(); out.println("<script>");
		 * out.println("alert('모든 정보를 입력해주셨으면 해요');"); out.println("history.back();");
		 * out.println("</script>"); out.close(); }else
		 */ 
		if(userDAO.join(userDTO) == 1){
			//System.out.println("여기는 오니?");
			session.setAttribute("userID", col1);
			response.setContentType("text/html; charset=utf-8");
			//PrintWriter out = response.getWriter(); // response 를 호출한 시점에서 이미 쫑이 난다... 이후 자바스크립트로 강제 링크 제어를 할 수 밖에 없다는 의미
			//out.println("<script>");
			//out.println("alert('회원가입에 성공하였습니다.');");
			//out.println("location.href='./myCartMain.go';");
			//out.println("</script>");
			//out.close();	
			forward.setRedirect(true);
			forward.setPath("main.jsp");
		}else if(userDAO.join(userDTO) == -1){
			//문자열값 공백 처리 주의하면서쓰자.. text/ht ml 이면 처리가 안된다
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 다른분이 그 아이디를 쓰고 있어요.');");
			out.println("history.back();");			
			out.println("</script>");			
			out.close();	
		}
		return forward;
	}

}
