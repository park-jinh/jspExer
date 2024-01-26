package service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WriteFormAction service start...");
		
		try {
			// 신규글
			int num = 0, ref=0, re_level=0, re_step=0;
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) pageNum = "1";
			//댓글
			
			request.setAttribute("num", num);
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("re_step", re_step);
			request.setAttribute("pageNum", pageNum);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "writeForm.jsp";
	}

}
