package board.MyTable;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;

public class MyTableDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BoardDAO boardDAO = new BoardDAO();
		HttpSession session=request.getSession();
		ActionForward forward = new ActionForward();
		int boardID = Integer.parseInt(request.getParameter("boardID"));
		String id= (String) session.getAttribute("userID");

		boolean result = false;
		
		result = boardDAO.delete(boardID, id);
		
		if(result == false) {
			System.out.println("삭제실패");
		}
		
		forward.setRedirect(true);
		forward.setPath("check.tb");
	
		return forward;
	}

}
