package board.MyTable;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;
import board.db.BoardDTO;

public class MyTableUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();
		HttpSession session = request.getSession();
		
		boolean result = false;
		
		int boardID = Integer.parseInt(request.getParameter("boardID"));

		
		String boardTitle = (String) request.getParameter("boardTitle");
		int boardPrice = Integer.parseInt(request.getParameter("boardPrice"));
		int boardEa = Integer.parseInt(request.getParameter("boardEa"));
		String boardMemo = request.getParameter("boardMemo");
		String boardSellerLink = request.getParameter("boardSellerLink");
		String boardTag = request.getParameter("boardTag");
		String boardUserID = (String) session.getAttribute("userID");
		String boardType = (String) request.getParameter("boardType");
		
		boardDTO.setBoardID(boardID);
		boardDTO.setBoardTitle(boardTitle);
		boardDTO.setBoardPrice(boardPrice);
		boardDTO.setBoardEa(boardEa);
		boardDTO.setBoardMemo(boardMemo);
		boardDTO.setBoardSellerLink(boardSellerLink);
		boardDTO.setBoardTag(boardTag);
		//이거 시간나면 modifiedDate getSet 해놓자
		boardDTO.setBoardDate(boardDAO.getDate());
		boardDTO.setBoardAvailable(1);
		boardDTO.setBoardUserID(boardUserID);
		boardDTO.setBoardType(boardType);

		result = boardDAO.update(boardDTO, boardID, boardUserID);

		if(result == false) {
			System.out.println("board modify fail");
			return null;
		}
		ActionForward forward = new ActionForward();

		forward.setRedirect(true);
		forward.setPath("view.tb?boardID="+boardDTO.getBoardID());

		return forward;
	}

}
