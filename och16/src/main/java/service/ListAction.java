package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ListAction Service start...");
		
		BoardDao bd = BoardDao.getInstance();
		
		try {
			int totCnt = bd.getTotalCnt(); //38
			// 난잡 paging 작업
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null || pageNum.equals("")) { pageNum="1"; }
			int currentPage = Integer.parseInt(pageNum);	// 1
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1)*pageSize +1;// 1 11
			int endRow = startRow + pageSize -1; // 10 20
			int startNum = totCnt - startRow + 1;
			
			// Board 조회
			List<Board> list = bd.boardList(startRow,endRow);
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize +1;
			int endPage = startPage + blockSize -1;
			
			//공갈 Page 방지
			if(endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("list", list);
			request.setAttribute("totCnt",totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// view 명칭
		return "listForm.jsp";
	}

}
