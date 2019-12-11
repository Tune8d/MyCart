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
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();
		ActionForward forward = null;
		
		//주석처리된 값은 DAO 로 자동처리할 값
		//int boardID = boardDAO.getNext();
		String boardTitle = request.getParameter("boardTitle");
		int boardPrice = Integer.parseInt(request.getParameter("boardPrice"));
		int boardEa = Integer.parseInt(request.getParameter("boardEa"));
		String boardSeller= request.getParameter("boardSeller");
		String boardSellerLink = request.getParameter("boardSellerLink");
		String boardUserID = (String) session.getAttribute("userID");
		//System.out.printf("@@@=> %s, %d, %d, %s, %s, %s\n", boardTitle, boardPrice, boardEa, boardSeller, boardSellerLink, boardUserID);

		if(boardUserID == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back();");			
			out.println("</script>");			
			out.close();
		}else if(boardTitle == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품명을 입력해주세요');");
			out.println("history.back();");			
			out.println("</script>");			
			out.close();	
		}else if(Integer.toString(boardPrice) == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('가격을 입력해주세요');");
			out.println("history.back();");			
			out.println("</script>");			
			out.close();	
		}else{
			int result = boardDAO.write(boardDTO);
			
			if(result == 1) {
				boardDTO.setBoardID(boardDAO.getNext());
				boardDTO.setBoardTitle(boardTitle);
				boardDTO.setBoardPrice(boardPrice);
				boardDTO.setBoardEa(boardEa);
				boardDTO.setBoardSeller(boardSeller);
				boardDTO.setBoardSellerLink(boardSellerLink);
				boardDTO.setBoardDate(boardDAO.getDate());
				boardDTO.setBoardAvailable(1); 
				boardDTO.setBoardUserID(boardUserID);
				
				request.setAttribute("data", boardDTO);
				
				forward = new ActionForward();
				forward.setPath("./board_view.jsp");
				
			}else if(result == -1) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('추가 실패');");
				out.println("history.back();");			
				out.println("</script>");			
				out.close();
			}
		}
		
		return forward;
	}
	

}
