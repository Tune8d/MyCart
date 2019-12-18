package board.MyTable;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;
import board.db.BoardDTO;

public class MyTableViewerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();
		HttpSession session = request.getSession();

		int boardID = Integer.parseInt(request.getParameter("boardID"));
		String id = (String) session.getAttribute("userID");

		boardDTO = boardDAO.getDetail(boardID, id);

		if (boardDTO == null) {
			System.out.println("유효하지 않는 경로입니다.");
			return null;
		}

		request.setAttribute("boardDTO", boardDTO);
		ActionForward forward = new ActionForward();

		forward.setRedirect(true);
		forward.setPath("boardView.jsp");
		return forward;

	}

}
