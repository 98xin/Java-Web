package bean;

public class CakeTypeBean {
	private int typeId;
	private String typeName;
	private int pId;
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	public CakeTypeBean(int typeId, String typeName, int pId) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.pId = pId;
	}
	public CakeTypeBean() {
		super();
	}
	
}
