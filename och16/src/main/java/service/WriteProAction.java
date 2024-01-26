package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. num , pageNum, writer ,  email , subject , passwd , content   Get
		// 2. Board board 생성하고 DTO Value Setting
		Board board = new Board();
		board.setWriter(request.getParameter("writer"));
		board.setEmail(request.getParameter("email"));
		board.setSubject(request.getParameter("subject"));
		board.setPasswd(request.getParameter("passwd"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteHost());
		// 3. BoardDao bd Instance
        try {
        	BoardDao bd = BoardDao.getInstance();
        	int result = bd.insert(board);
        	// 4. request 객체에 result, num , pageNum 	        
        	request.setAttribute("result", result);
        	request.setAttribute("num", request.getParameter("num"));
        	request.setAttribute("pageNum", request.getParameter("pageNum"));
        } catch(Exception e) {
        	e.printStackTrace();
        }
        return "writePro.jsp";
	}

}
