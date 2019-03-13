package bean;

import java.util.Date;

public class ShoppingCartDetailBean {
	private int shoppingCartDetailId;
	private int shoppingCartId;
	private CakeBean cake;
	private int count;
	private Date addtime;
	public int getShoppingCartDetailId() {
		return shoppingCartDetailId;
	}
	public void setShoppingCartDetailId(int shoppingCartDetailId) {
		this.shoppingCartDetailId = shoppingCartDetailId;
	}
	public int getShoppingCartId() {
		return shoppingCartId;
	}
	public void setShoppingCartId(int shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}
	public CakeBean getCake() {
		return cake;
	}
	public void setCake(CakeBean cake) {
		this.cake = cake;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public ShoppingCartDetailBean(int shoppingCartDetailId, int shoppingCartId, CakeBean cake, int count,
			Date addtime) {
		super();
		this.shoppingCartDetailId = shoppingCartDetailId;
		this.shoppingCartId = shoppingCartId;
		this.cake = cake;
		this.count = count;
		this.addtime = addtime;
	}
	public ShoppingCartDetailBean() {
		super();
	}
	
}
