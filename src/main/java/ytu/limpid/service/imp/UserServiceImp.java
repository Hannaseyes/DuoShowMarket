package ytu.limpid.service.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ytu.limpid.dao.UserDao;
import ytu.limpid.entity.Address;
import ytu.limpid.entity.Brand;
import ytu.limpid.entity.Cart;
import ytu.limpid.entity.Order;
import ytu.limpid.entity.Preference;
import ytu.limpid.entity.User;
import ytu.limpid.service.UserService;
@Service
public class UserServiceImp implements UserService {
	@Resource
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	/**
	 * �û�ע��
	 */
	@Override
	@Transactional
	public void register(User user) {
		userDao.register(user);
	}
	
	/**
	 * �û���¼
	 * @return 
	 */
	@Override
	public  List<User> login(Map<String, String> map) {
		return userDao.login(map);
	}

	/**
	 * ��ȡ�û�ƫ��Ʒ��
	 */
	@Override
	public List<Brand> listRecommendBrand(Map<String, String> map) {
		return userDao.listRecommendBrand(map);
	}
	
	/**
	 * ���ݲ�����ȡ�û���Ϣ
	 */
	@Override
	public List<User> getUser(Map<String, String> map) {
		return userDao.getUser(map);
	}

	/**
	 * ��ȡ�û����ﳵ��Ϣ
	 */
	@Override
	public List<Cart> getUserCart(Map<String, Object> map) {
		return userDao.getUserCart(map);
	}

	@Override
	public void addAddress(Address address) {
		userDao.addAddress(address);
	}

	@Override
	public List<Address> getAddress(Map<String, Object> map) {
		return userDao.getAddress(map);
	}

	@Override
	public void addOrder(Order order) {
		userDao.addOrder(order);
	}

	@Override
	public void deleteCart(Map<String, Object> map) {
		userDao.deleteCart(map);
	}

	@Override
	public void addCart(Cart cart) {
		userDao.addCart(cart);
	}

	@Override
	public void deleteCartGoods(Map<String, Object> map) {
		userDao.deleteCart(map);
	}

	@Override
	public List<Order> getOrder(Map<String, Object> map) {
		return userDao.getOrder(map);
	}

	@Override
	public void addPreference(Preference preference) {
		userDao.addPreference(preference);
	}

	@Override
	public void updateOrder(Order order) {
		userDao.updateOrder(order);
	}

	@Override
	public List<Brand> listAllRecommendBrand() {
		return userDao.listAllRecommendBrand();
	}
}
