package board.MyTable;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;
import board.db.BoardDTO;

public class MyTableReadAction implements Action {
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardDAO boardDAO= new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();
		HttpSession session=request.getSession();
		
		String id= (String) session.getAttribute("userID");
		ActionForward forward = new ActionForward();

		boardDTO.setBoardUserID(id);
		boardDAO.read(0, id);
		
		if(id==null){
			forward.setRedirect(true);
			forward.setPath("login.jsp");
		}
		
		forward.setRedirect(true);
		forward.setPath("boardRead.jsp");
		
		return forward;
	}

}
