package ytu.limpid.service;

import java.util.List;
import java.util.Map;

import ytu.limpid.entity.Address;
import ytu.limpid.entity.Brand;
import ytu.limpid.entity.Cart;
import ytu.limpid.entity.Order;
import ytu.limpid.entity.Preference;
import ytu.limpid.entity.User;

public interface UserService {
	/** 用户注册 */
	void register(User user);
	/** 用户登陆 */
	List<User> login(Map<String, String> map);
	/** 根据用户名查询用户 */
	List<User> getUser(Map<String, String> map);
	/** 根据用户ID查询用户偏好品牌 */
	List<Brand> listRecommendBrand(Map<String, String> map);
	/** 查询热门类型品牌 */
	List<Brand> listAllRecommendBrand();
	/** 查询用户购物车信息 */
	List<Cart> getUserCart(Map<String, Object> map);
	/** 添加收货地址 */
	void addAddress(Address address);
	/** 获取收货地址 */
	List<Address> getAddress(Map<String, Object> map);
	/** 添加订单 */
	void addOrder(Order order);
	/** 清空购物车 */
	void deleteCart(Map<String, Object> map);
	/** 添加到购物车 */
	void addCart(Cart cart);
	/** 删除购物车商品 */
	void deleteCartGoods(Map<String, Object> map);
	/** 获取用户订单 */
	List<Order> getOrder(Map<String, Object> map);
	/** 添加用户喜好 */
	void addPreference(Preference preference);
	/** 更新订单信息 */
	void updateOrder(Order order);
}
