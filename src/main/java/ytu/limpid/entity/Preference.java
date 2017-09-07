package ytu.limpid.entity;

/**
 * 用户喜好表
 * @author Wang Hanqing
 */
public class Preference {
	private Integer id;
	private Integer userId;
	private Integer brandType;
	private Integer hot;
	
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
	public Integer getBrandType() {
		return brandType;
	}
	public void setBrandType(Integer brandType) {
		this.brandType = brandType;
	}
	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}
}
