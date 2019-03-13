package page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CakeBean;
import bean.UserBean;
import dao.CakeDao;

/**
 * Servlet implementation class CakeByPageServlet
 */
@WebServlet("/CakeByPage")
public class CakeByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CakeByPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1、获取当前页
		String currentPagestr = request.getParameter("currentPage");
		// 2、获取搜索类型
		String type = request.getParameter("type");
		// 3、获取搜索大小
		String size = request.getParameter("search_word");
		int currentPage = 1;
		if(currentPagestr != null && !currentPagestr.equals("")) {
			currentPage = Integer.parseInt(currentPagestr);
		}
		//获取数据
		HttpSession session = request.getSession();
		List<CakeBean> cakeList = null;
		CakeDao cakeDao = new CakeDao();
		if(session.getAttribute("cakeList") == null) {
			cakeList = cakeDao.getAllData();
		}else {
			cakeList = (List<CakeBean>) session.getAttribute("cakeList");
		}	
		session.setAttribute("cakeList", cakeList);
		//对当前页进行设置
		Page page = new Page();
		page.setTotalCount(cakeList.size());
		page.setCurrentPage(currentPage);
		//子列表
		List<CakeBean> subcakeList = new ArrayList<CakeBean>();
		int fromIndex = (currentPage-1) * page.getCount();
		
		int yushu = (page.getTotalCount()%page.getCount()==0)?page.getCount():page.getTotalCount()%page.getCount() ;
		int toIndex = (currentPage < page.getTotalPage())?(fromIndex + page.getCount()):(fromIndex + yushu);
		
		subcakeList = cakeList.subList(fromIndex, toIndex);
				
		request.setAttribute("subcakeList", subcakeList);
		request.setAttribute("page", page);
		request.getRequestDispatcher("products.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
