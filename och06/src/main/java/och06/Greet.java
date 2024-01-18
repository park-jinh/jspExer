package och06;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

/**
 * Servlet implementation class Greet
 */
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PrintWriter log;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Greet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init start...");
		try {
			log = new PrintWriter(new FileWriter("c:/log/log.txt",true));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("헐 !");
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("destroy start...");
		log.flush();
		// 유언장
		if(log !=null) log.close();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet start...");
		String name = request.getParameter("name");
		String msg = name + "님 반가워\r\n";
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT\r\n",gc,gc);
		// File 출력 --> msg
		log.print(date + msg);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 화면 출력 --> msg
		out.println("<html><body><h2>인사</h2>"+msg);
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
