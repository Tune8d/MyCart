package board.MyTable;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;
import board.db.BoardDTO;

public class MyTableUpdateViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		int boardID = Integer.parseInt(request.getParameter("boardID"));
		String id = (String) session.getAttribute("userID");

		boardDTO = boardDAO.getDetail(boardID, id);
		
		if(boardDTO == null) {
			System.out.println("수정불가");
			return null;
		}

		request.setAttribute("boardDTO", boardDTO);
		
		forward.setRedirect(true);
		forward.setPath("boardUpdate.jsp");

		return forward;
	}

}
