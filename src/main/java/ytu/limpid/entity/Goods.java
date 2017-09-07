package ytu.limpid.entity;

import java.math.BigDecimal;

/**
 * ��Ʒʵ��
 * @author Wang Hanqing
 */
public class Goods {

	private String id;// ��ƷID
	private String name;// ��Ʒ����
	private String brandId;// Ʒ��ID
	private String type;// ��Ʒ����
	private BigDecimal price;// ��Ʒ�۸�
	private String surplus;// ��Ʒʣ��
	private String picture;// ��ƷͼƬ��ַ
	private String createTime;// ��Ʒ����ʱ��
	private String introduce;// ��Ʒ����
	private Integer goodsNumber;// ��������
	
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
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
	public String getBrandId() {
		return brandId;
	}
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public BigDecimal getPrice() {
		return price.setScale(2,BigDecimal.ROUND_HALF_UP);
	}
	public void setPrice(BigDecimal price) {
		this.price = price.setScale(2,BigDecimal.ROUND_HALF_UP);;
	}
	public String getSurplus() {
		return surplus;
	}
	public void setSurplus(String surplus) {
		this.surplus = surplus;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(Integer goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", brandId=" + brandId
				+ ", type=" + type + ", price=" + price + ", surplus="
				+ surplus + ", picture=" + picture + ", createTime="
				+ createTime + "]";
	}
}
