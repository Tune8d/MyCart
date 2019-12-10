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
		//Timestamp boardDate = boardDAO.getDate();
		// int boardAvailable = 1
		String boardUserID = (String) session.getAttribute("userID");

		boardDTO.setBoardID(boardDAO.getNext());
		boardDTO.setBoardTitle(boardTitle);
		boardDTO.setBoardPrice(boardPrice);
		boardDTO.setBoardEa(boardEa);
		boardDTO.setBoardSeller(boardSeller);
		boardDTO.setBoardSellerLink(boardSellerLink);
		boardDTO.setBoardDate(boardDAO.getDate());
		boardDTO.setBoardAvailable(1); 
		boardDTO.setBoardUserID(boardUserID);
		
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
		}else if(boardDAO.write(boardDTO) == 1){
			System.out.println("이거 보이면 출력");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('추가 완료');");
			out.println("location.href='./myCart.go';");
			out.println("</script>");			
			out.close();	
			return forward;
		}else if(boardDAO.write(boardDTO) == -1){
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('추가 실패');");
			out.println("history.back();");			
			out.println("</script>");			
			out.close();	
		}
		return null;
	}
	

}
