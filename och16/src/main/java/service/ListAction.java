package service;

import java.io.IOException;
import java.sql.SQLException;

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
			request.setAttribute("totCnt", totCnt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// view 명칭
		return "listForm.jsp";
	}

}
