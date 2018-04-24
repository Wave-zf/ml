package cn.itzf.ml.entity;


public class Products {
	
	private String id;
	private String name;
	private double money;
	private String imgurl;
	private String receiverName; // 收货人姓名
	private String receiverPhone; // 收货人电话
	private String description;
	private User user;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Products [id=" + id + ", name=" + name + ", money=" + money + ", imgurl=" + imgurl + ", receiverName="
				+ receiverName + ", receiverPhone=" + receiverPhone + ", description=" + description + ", user=" + user
				+ "]";
	}
	
	
	

	

}
