package board.MyTable;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.MyTable.ActionForward;
import board.db.BoardDAO;
import board.db.BoardDTO;

public class MyTableWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();
		ActionForward forward = null;

		String boardTitle = (String) request.getParameter("boardTitle");
		int boardPrice = Integer.parseInt(request.getParameter("boardPrice"));
		int boardEa = Integer.parseInt(request.getParameter("boardEa"));
		String boardMemo = request.getParameter("boardMemo");
		String boardSellerLink = request.getParameter("boardSellerLink");
		String boardTag = request.getParameter("boardTag");
		String boardUserID = (String) session.getAttribute("userID");

		// 주석처리된 값은 DAO 로 자동처리할 값
		// int boardID = boardDAO.getNext();
		// System.out.printf("@@@=> %s, %d, %d, %s, %s, %s\n", boardTitle, boardPrice,
		// boardEa, boardSeller, boardSellerLink, boardUserID);


			boardDTO.setBoardID(boardDAO.getNext());
			boardDTO.setBoardTitle(boardTitle);
			boardDTO.setBoardPrice(boardPrice);
			boardDTO.setBoardEa(boardEa);
			boardDTO.setBoardMemo(boardMemo);
			boardDTO.setBoardSellerLink(boardSellerLink);
			boardDTO.setBoardTag(boardTag);
			boardDTO.setBoardDate(boardDAO.getDate());
			boardDTO.setBoardAvailable(1);
			boardDTO.setBoardUserID(boardUserID);

			int result = boardDAO.write(boardDTO);

			if (result == 1) {
				request.setAttribute("data", boardDTO);

				forward = new ActionForward();
				forward.setPath("boardRead.jsp");
				return forward;
			} else if (result == -1) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('추가 실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}

			return forward;
		}



	}

