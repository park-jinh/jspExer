package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DeleteFormAction service start...");
		// 1. num , pageNum Get
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		// 2. BoardDao bd Instance
		BoardDao bd = BoardDao.getInstance();
		// 3. Board board = bd.select(num);
		try {
			Board board = bd.select(num);
			// 4. request 객체에  num , pageNum ,board
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "deleteForm.jsp";
	}

}
