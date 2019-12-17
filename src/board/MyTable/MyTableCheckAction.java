package board.MyTable;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;

public class MyTableCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardDAO boardDAO = new BoardDAO();
		List boardList = new ArrayList();
		HttpSession session=request.getSession();
		String id= (String) session.getAttribute("userID");
		ActionForward forward = new ActionForward();
		
		int page = 1;
		int limit = 5;
		int boardListSum =0;
		int boardListAvg = 0;
		int boardListItems = 0;
		
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = boardDAO.getListCount(id);
		boardList = boardDAO.getBoardList(id, page, limit);
		boardListSum = boardDAO.getBoardListSum(id);
		boardListAvg = boardDAO.getBoardListAvg(id);
		boardListItems = boardDAO.getBoardListItems(id);
		
		//총 페이지 수
 		int maxpage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리
 		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
 		int startpage = (((int) ((double)page / 10+ 0.9)) - 1) * 10 + 1;
 		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...) --> 5로하고싶으면 이 세개 제어
		int endpage = startpage+10-1;
		
		if (endpage> maxpage) endpage= maxpage;
		
		//이게 바로 응답이 viewer 의 null 값을 마주치지 않게 하는 사전정보를 제공하는 수단이다.
 		request.setAttribute("page", page); //현재 페이지 수
 		request.setAttribute("maxpage", maxpage); //최대 페이지 수
 		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수
 		request.setAttribute("endpage", endpage); //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listCount); //글 수
		request.setAttribute("boardlist", boardList);
		request.setAttribute("boardListSum", boardListSum);
		request.setAttribute("boardListAvg", boardListAvg);
		request.setAttribute("boardListItems", boardListItems);

		
		forward.setRedirect(true);
		forward.setPath("boardCheck.jsp");
		return forward;

	}

}
