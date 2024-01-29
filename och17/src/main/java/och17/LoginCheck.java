package och17;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter ("/sub2/*")
public class LoginCheck extends HttpFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// Session 도출 방법
		HttpSession session = httpServletRequest.getSession();
		System.out.println("LoginCheck doFilter ...");
		if(session == null || session.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp");
		}
		String id = (String)session.getAttribute("id");
		if(id == null || id.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp");
		}
		// chain으로 가라
		super.doFilter(request, response, chain);
	}
	
}
