package bean;

import java.io.Serializable;

public class CakeBean  implements Serializable{
	private int cakeId;
	private String cakeName;
	private String type;
	private int size;
	private double price;
	private String path;
	private String smallpicture1;
	private String smallpicture2;
	private String smallpicture3;
	private String introduce;
	
	
	public CakeBean(int cakeId, String cakeName, String type, int size, double price, String path,
			String smallpicture1, String smallpicture2, String smallpicture3, String introduce) {
		super();
		this.cakeId = cakeId;
		this.cakeName = cakeName;
		this.type = type;
		this.size = size;
		this.price = price;
		this.path = path;
		this.smallpicture1 = smallpicture1;
		this.smallpicture2 = smallpicture2;
		this.smallpicture3 = smallpicture3;
		this.introduce = introduce;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getSmallpicture1() {
		return smallpicture1;
	}
	public void setSmallpicture1(String smallpicture1) {
		this.smallpicture1 = smallpicture1;
	}
	public String getSmallpicture2() {
		return smallpicture2;
	}
	public void setSmallpicture2(String smallpicture2) {
		this.smallpicture2 = smallpicture2;
	}
	public String getSmallpicture3() {
		return smallpicture3;
	}
	public void setSmallpicture3(String smallpicture3) {
		this.smallpicture3 = smallpicture3;
	}
	public CakeBean() {
		super();
	}
	public int getCakeId() {
		return cakeId;
	}
	public void setCakeId(int cakeId) {
		this.cakeId = cakeId;
	}
	public String getCakeName() {
		return cakeName;
	}
	public void setCakeName(String cakeName) {
		this.cakeName = cakeName;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
