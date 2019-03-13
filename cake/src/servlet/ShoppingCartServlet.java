package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ShoppingCartBean;
import bean.ShoppingCartDetailBean;
import bean.UserBean;
import dao.ShoppingCartDao;
import dao.ShoppingCartDetailDao;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/shoppingCart")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String remark = request.getParameter("remark");
		
		if(remark.equals("add")) {
			add(request,response);
		}else if(remark.equals("select")) {
			select(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cakeId = Integer.parseInt(request.getParameter("cakeId"));
		//加入购物车
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		if(user!=null) {
			int userId = user.getUserId();
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			//从数据库中查询用户的购物车
			ShoppingCartBean shoppingCart = shoppingCartDao.getShoppingCartByUserId(userId);
			if(shoppingCart.getUserId()==0) {
				shoppingCart = shoppingCartDao.create(userId);
			}
			ShoppingCartDetailDao shoppingCartDetailDao = new ShoppingCartDetailDao();			
			ShoppingCartDetailBean shoppingCartDetail = null;
			shoppingCartDetail = shoppingCartDetailDao.add(shoppingCart.getShoppingCartId(), cakeId, 1);
			List<ShoppingCartDetailBean> shoppingCartDetailList = shoppingCartDetailDao.getShoppingCartDetailByShoppingCartId(shoppingCart.getShoppingCartId());	
			//shoppingCart.setShoppingCartDetailList(shoppingCartDetailList);
			//request.setAttribute("shoppingCart", shoppingCart);
			request.setAttribute("shoppingCartDetailList", shoppingCartDetailList);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
		
	}
	
	protected void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		if(user!=null) {
			int userId = user.getUserId();
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			//从数据库中查询用户的购物车
			ShoppingCartBean shoppingCart = shoppingCartDao.getShoppingCartByUserId(userId);
			
			ShoppingCartDetailDao shoppingCartDetailDao = new ShoppingCartDetailDao();
			List<ShoppingCartDetailBean> shoppingCartDetailList = shoppingCartDetailDao.getShoppingCartDetailByShoppingCartId(shoppingCart.getShoppingCartId());
			request.setAttribute("shoppingCartDetailList", shoppingCartDetailList);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
		

		
	}

}
