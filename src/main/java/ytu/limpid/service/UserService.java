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
	/** �û�ע�� */
	void register(User user);
	/** �û���½ */
	List<User> login(Map<String, String> map);
	/** �����û�����ѯ�û� */
	List<User> getUser(Map<String, String> map);
	/** �����û�ID��ѯ�û�ƫ��Ʒ�� */
	List<Brand> listRecommendBrand(Map<String, String> map);
	/** ��ѯ��������Ʒ�� */
	List<Brand> listAllRecommendBrand();
	/** ��ѯ�û����ﳵ��Ϣ */
	List<Cart> getUserCart(Map<String, Object> map);
	/** ����ջ���ַ */
	void addAddress(Address address);
	/** ��ȡ�ջ���ַ */
	List<Address> getAddress(Map<String, Object> map);
	/** ��Ӷ��� */
	void addOrder(Order order);
	/** ��չ��ﳵ */
	void deleteCart(Map<String, Object> map);
	/** ��ӵ����ﳵ */
	void addCart(Cart cart);
	/** ɾ�����ﳵ��Ʒ */
	void deleteCartGoods(Map<String, Object> map);
	/** ��ȡ�û����� */
	List<Order> getOrder(Map<String, Object> map);
	/** ����û�ϲ�� */
	void addPreference(Preference preference);
	/** ���¶�����Ϣ */
	void updateOrder(Order order);
}
