package ytu.limpid.entity;

/**
 * Ʒ��ʵ����
 */
public class Brand {
	
	private String id;//Ʒ��ID
	private String name;//Ʒ������
	private String introduce;//Ʒ�ƽ���
	private String picture;//Ʒ��ͼƬ·��
	private String type;//Ʒ������ID
	
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
