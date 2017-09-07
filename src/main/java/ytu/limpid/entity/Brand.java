package ytu.limpid.entity;

/**
 * 品牌实体类
 */
public class Brand {
	
	private String id;//品牌ID
	private String name;//品牌名称
	private String introduce;//品牌介绍
	private String picture;//品牌图片路径
	private String type;//品牌类型ID
	
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
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", introduce="
				+ introduce + ", picture=" + picture + ", type=" + type + "]";
	}
	
}
