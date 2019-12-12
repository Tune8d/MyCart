package board.MyTable;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.db.BoardDAO;

public class MyTableDeleteAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 request.setCharacterEncoding("utf-8");
		 
		 ActionForward forward = new ActionForward();

		 boolean result = false;
		 boolean boardNumCheck = false;
		 int boardID = Integer.parseInt(request.getParameter("boardID"));
		 System.out.println("보드 아이디넘버:"+ boardID);
		 System.out.println("보드테이블 파라메터:"+boardID);
		 BoardDAO boarddao = new BoardDAO();
		/*
		 * boardNumCheck =
		 * boarddao.isBoardNumber(Integer.parseInt(request.getParameter("boardID")));
		 */	   	
		/*
		 * if(boardNumCheck == false){
		 * 
		 * return null; }
		 */
	   	
		 result = boarddao.delete(boardID);

	   	if(result ==false) {
	   		System.out.println("delete fail");
	   		return null;
	   	}
		 System.out.println("게시판 삭제 성공");
		 forward.setRedirect(true);
		 forward.setPath("/board.jsp");
		 return forward;
	}
}
