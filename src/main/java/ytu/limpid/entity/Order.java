package ytu.limpid.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 订单实体类
 * @author Wang Hanqing
 */
public class Order {
	private Integer id;
	private Integer userId;
	private BigDecimal price;
	private Date createTime;
	private String status;
	private String statusStr;
	private String goodsId;
	private String address;
	private String orderNumber;
	private BigDecimal totalPrice;
	private List<Goods> goods;
	
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public BigDecimal getPrice() {
		return price.setScale(2,BigDecimal.ROUND_HALF_UP);
	}
	public void setPrice(BigDecimal price) {
		this.price = price.setScale(2,BigDecimal.ROUND_HALF_UP);
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStatusStr() {
		if("0".equals(status)){
			statusStr="待付款";
		}else if("1".equals(status)){
			statusStr="待收货";
		}else if("2".equals(status)){
			statusStr="待评价";
		}else if("3".equals(status)){
			statusStr="已完成";
		}
		return statusStr;
	}
	public void setStatusStr(String statusStr) {
		if("0".equals(status)){
			statusStr="待付款";
		}else if("1".equals(status)){
			statusStr="待收货";
		}else if("2".equals(status)){
			statusStr="待评价";
		}else if("3".equals(status)){
			statusStr="已完成";
		}
		this.statusStr = statusStr;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public BigDecimal getTotalPrice() {
		return totalPrice.setScale(2,BigDecimal.ROUND_HALF_UP);
	}
	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice.setScale(2,BigDecimal.ROUND_HALF_UP);
	}
}
