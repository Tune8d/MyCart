package board.MyTable;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;

public class MyTableReadAction implements Action {
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//BasketAddAction, BasketListAction 참고.
		// 로그인과 동시에 본 action 이 실행되어야 한다
		//흐름은.. 로그인->readAction(null이면 신규제작 안내)->create, updated, delete 활성화
		BoardDAO boardDAO=new BoardDAO();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		if(id==null){
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		Vector vector = boardDAO.read(id);
		List boardlist=(ArrayList)vector.get(0);
		List userlist=(ArrayList)vector.get(1);
		
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("userlist", userlist);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board.jsp");
		
		return forward;
	}

}
