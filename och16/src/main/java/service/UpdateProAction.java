package service;

import java.io.IOException;
import java.sql.SQLException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UpdateProAction service start...");
		// 1. num , pageNum, writer ,  email , subject , passwd , content   Get
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String writer= request.getParameter("writer");
		String email= request.getParameter("email");
		String subject= request.getParameter("subject");
		String passwd= request.getParameter("passwd");
		String content= request.getParameter("content");
		// 2. Board board 생성하고 DTO Value Setting
		Board board = new Board();
		board.setNum(num);
		board.setWriter(writer);
		board.setEmail(email);
		board.setSubject(subject);
		board.setPasswd(passwd);
		board.setContent(content);
		board.setIp(request.getRemoteHost());
		// 3. BoardDao bd Instance
		BoardDao bd = BoardDao.getInstance();
		int result=0;
		try {
			result = bd.update(board);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 4. request 객체에 result, num , pageNum 
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		// 5.updatePro.jsp Return
		return "updatePro.jsp";
	}

}
