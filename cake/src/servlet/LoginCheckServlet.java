package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import dao.UserDao;
import org.json.JSONObject;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/check")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String checkbox = request.getParameter("checkbox");
		if(!username.equals("")&&!password.equals("")) {
			UserDao userDao = new UserDao();
			UserBean user = userDao.getUserByName(username);
			if(user!=null&&user.getUsername()!=null) {//找到用户
				String result;
				if (password.equals(user.getPassword())) {//用户名密码正确
					result="ok";
				} else {
					result="fail";
				}
				JSONObject json=new JSONObject();
				
				json.put("result", result);
				json.put("username", user.getUsername());
				json.put("password", user.getPassword());
				response.getWriter().print(json);
				HttpSession session=request.getSession();
				session.setAttribute("user", user);
				if("on".equals(checkbox)) {
					session.setMaxInactiveInterval(60*60*24*7);
					Cookie cookie= new Cookie("JSESSIONID",session.getId());//设置session中的cookie
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}			
			}else {//没有找到用户
				request.getRequestDispatcher("main.jsp").forward(request,response);
			}
		}

	}

}
