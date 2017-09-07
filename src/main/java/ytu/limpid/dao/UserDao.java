package ytu.limpid.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ytu.limpid.entity.Address;
import ytu.limpid.entity.Brand;
import ytu.limpid.entity.Cart;
import ytu.limpid.entity.Order;
import ytu.limpid.entity.Preference;
import ytu.limpid.entity.User;
@Repository
public interface UserDao {
	/** �û�ע�� */
	void register(User user);
	/** �û���¼ */
	List<User> login(Map<String, String> map);
	/** ���ݲ�����ȡ�û���Ϣ */
	List<User> getUser(Map<String, String> map);
	/** ��ȡ�û����ﳵ��Ϣ */
	List<Cart> getUserCart(Map<String, Object> map);
	/** �����û�ID��ѯ�û�ƫ��Ʒ�� */
	List<Brand> listRecommendBrand(Map<String, String> map);
	/** ��ѯ�����ȶ�Ʒ�� */
	List<Brand> listAllRecommendBrand();
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
	/** ��ȡ�û����� */
	List<Order> getOrder(Map<String, Object> map);
	/** ����û�ϲ�� */
	void addPreference(Preference preference);
	/** ���¶��� */
	void updateOrder(Order order);
}
