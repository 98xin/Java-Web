package bean;

import java.util.List;

public class ShoppingCartBean {
	private int shoppingCartId;
	private int userId;
	private List<ShoppingCartDetailBean> shoppingCartDetailList;
	public ShoppingCartBean(int shoppingCartId, int userId, List<ShoppingCartDetailBean> shoppingCartDetailList) {
		super();
		this.shoppingCartId = shoppingCartId;
		this.userId = userId;
		this.shoppingCartDetailList = shoppingCartDetailList;
	}
	public ShoppingCartBean() {
		super();
		this.shoppingCartId=0;
		this.userId = 0;
	}
	public int getShoppingCartId() {
		return shoppingCartId;
	}
	public void setShoppingCartId(int shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public List<ShoppingCartDetailBean> getShoppingCartDetailList() {
		return shoppingCartDetailList;
	}
	public void setShoppingCartDetailList(List<ShoppingCartDetailBean> shoppingCartDetailList) {
		this.shoppingCartDetailList = shoppingCartDetailList;
	}
	
}
