package ytu.limpid.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ytu.limpid.entity.Address;
import ytu.limpid.entity.Brand;
import ytu.limpid.entity.Cart;
import ytu.limpid.entity.Comment;
import ytu.limpid.entity.Goods;
import ytu.limpid.entity.Order;
import ytu.limpid.entity.Preference;
import ytu.limpid.entity.User;
import ytu.limpid.service.GoodsService;
import ytu.limpid.service.UserService;
import ytu.limpid.util.MD5Util;
import ytu.limpid.util.ResponseUtil;

/**
 * 用户操作的controller
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@Resource
	private GoodsService goodsService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/** 用户注册 
	 * @throws IOException */
	@RequestMapping(value = "/registrationCtrl")
	public void register(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "address") String addressStr,
			@RequestParam(value = "preference") String preferenceStr,
			HttpServletResponse response) throws IOException {
		// 设置请求参数
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userName", username);
		// 根据参数查询是否存在这个用户
		List<User> users = this.userService.getUser(paramMap);
		if(users.size()!=0) {
			ResponseUtil.setResponseStr(response, "该用户已注册");
		}else {
			// 添加用户注册基本信息
			User user = new User();
			user.setUserName(username);
			user.setUserPassWord(MD5Util.string2MD5(password));
			this.userService.register(user);
			
			// 添加用户收货地址
			users = this.userService.getUser(paramMap);
			Address address = new Address();
			address.setUserId(users.get(0).getUserId());
			address.setAddress(addressStr);
			this.userService.addAddress(address);
			
			// 添加用户喜好产品类型
			Preference preference = new Preference();
			preference.setUserId(users.get(0).getUserId());
			preference.setHot(5);
			String[] preferenceArr = preferenceStr.split(",");
			for (int i = 0; i < preferenceArr.length; i++) {
				preference.setBrandType(Integer.parseInt(preferenceArr[i]));
				this.userService.addPreference(preference);
			}
			
			ResponseUtil.setResponseStr(response, "注册成功，请登录");
		}
	}

	/** 用户登录 */
	@RequestMapping(value = "/loginCtrl")
	public String login(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "kaptcha") String kaptcha,
			HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("users") != null) {
			session.setAttribute("warn", "login");
		}
		
	    //从session中取出servlet生成的验证码text值  
	    String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);   
	    //校验验证码是否正确  
	    if (kaptcha == null || !kaptcha.equalsIgnoreCase(kaptchaExpected)){  
	    	session.setAttribute("warn", "kaptchaError");
	    	return "login";
	    }  
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userName", username);
		map.put("userPassword", MD5Util.string2MD5(password));
		List<User> users = userService.login(map);

		if (users.size() == 0) {
			session.setAttribute("warn", "fail");
			return "login";
		} else {
			session.setAttribute("users", users);
		}
		return "index";
	}

	@RequestMapping(value = "/logoutCtrl")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/listRecommendBrand")
	public void listRecommendBrand(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws IOException {
		List<User> userList = (List<User>)session.getAttribute("users");
		//获取用户ID
		String userId="";
		if(userList!=null&&!userList.isEmpty()){
			userId = userList.get(0).getUserId().toString();
		} 
		
		if(userId != null && !"".equals(userId)) {
			// 封装查询参数
			Map<String, String> map = new HashMap<String, String>();
			map.put("userId", userId);
			
			// 执行查询
			List<Brand> recommendBrandList = userService.listRecommendBrand(map);
			ResponseUtil.setResponseList(response, recommendBrandList);
		}else {
			// 查询统计品牌热度 
			List<Brand> recommendBrandList = userService.listAllRecommendBrand();
			ResponseUtil.setResponseList(response, recommendBrandList);
		}
	}
	
	/**
	 * 获取用户购物车信息
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getUserCart")
	public String getUserCart(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws IOException {
		// 获取用户ID
		String userId = ((List<User>)session.getAttribute("users")).get(0).getUserId().toString();
		List<User> users = (List<User>)session.getAttribute("users");
		if(!users.get(0).getUserId().toString().equals(userId)){
			return "error";
		}else {
			Map<String, Object>  paramMap = new HashMap<String, Object>();
			paramMap.put("userId", Integer.parseInt(userId));
			List<Cart> cart = this.userService.getUserCart(paramMap);
			
			List<Goods> goodsList = new ArrayList<Goods>();
			for (Cart cartGoods : cart) {
				paramMap.put("id", cartGoods.getGoodsId());
				Goods goods = this.goodsService.getGoods(paramMap);
				goods.setGoodsNumber(cartGoods.getGoodsNumber());
				goodsList.add(goods);
			}
			
			List<Address> addressList = this.userService.getAddress(paramMap);
			
			System.out.println(addressList);
			request.setAttribute("cart", goodsList);
			request.setAttribute("addressList", addressList);
			return "cart";
		}
	}
	
	/**
	 * 提交订单
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addOrder")
	public void addOrder(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws IOException {
		/* 获取参数 */
		Integer userId = ((List<User>)session.getAttribute("users")).get(0).getUserId();// 用户ID
		String goodsId = request.getParameter("goodsId");// 付款商品ID
		goodsId = goodsId.substring(0,goodsId.length() - 1);
		BigDecimal price = new BigDecimal(request.getParameter("allTotalPrice"));// 商品总价
		BigDecimal finalPrice = new BigDecimal(request.getParameter("finalPrice"));// 订单总价
		String address = request.getParameter("address");//收货地址
		
		/* 包装实体类 */
		Order order = new Order();
		order.setAddress(address);
		order.setGoodsId(goodsId);
		order.setUserId(userId);
		order.setPrice(price);
		order.setTotalPrice(finalPrice);
		
		/* 添加订单 */
		this.userService.addOrder(order);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		this.userService.deleteCart(paramMap);
		/* 清空购物车 */
	}
	
	/**
	 * 添加购物车
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addCart")
	public void addCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		Cart cart = new Cart();
		cart.setGoodsId(Integer.parseInt(request.getParameter("id")));
		cart.setGoodsNumber(Integer.parseInt(request.getParameter("goodsNumber")));
		cart.setUserId(((List<User>)session.getAttribute("users")).get(0).getUserId());
		userService.addCart(cart);
	}
	
	/**
	 * 添加购物车
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/deleteCartGoods")
	public void deleteCartGoods(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", ((List<User>)session.getAttribute("users")).get(0).getUserId());
		paramMap.put("goodsId", request.getParameter("goodsId"));

		userService.deleteCartGoods(paramMap);
	}
	
	/**
	 * 获取用户订单
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getOrder")
	public String getOrder(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws IOException {
		// 获取用户ID
		String userId = ((List<User>)session.getAttribute("users")).get(0).getUserId().toString();
		List<User> users = (List<User>)session.getAttribute("users");
		if(!users.get(0).getUserId().toString().equals(userId)){
			return "error";
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		List<Order> orderList = userService.getOrder(paramMap);
		for (Order order : orderList) {
			paramMap.put("goodsId", order.getGoodsId());
			List<Goods> goodsList = goodsService.getGoodsById(paramMap);
			order.setGoods(goodsList);
		}
		request.setAttribute("orderList", orderList);
		return "order";
	}
	
	/**
	 * 用户付款
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/pay")
	public void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Order order = new Order();
		order.setStatus(request.getParameter("status"));
		order.setOrderNumber(request.getParameter("orderNumber"));
		userService.updateOrder(order);
	}
	
	
	/** 跳转到评价商品页面 */
	@RequestMapping(value = "/commentGoods")
	public String commentGoods(HttpServletRequest request, HttpServletResponse response) {
		String goodsId = request.getParameter("goodsId");
		String orderNumber = request.getParameter("orderNumber");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("goodsId", goodsId);
		List<Goods> goodsList = goodsService.getGoodsById(paramMap);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("goodsIdStr", goodsId);
		request.setAttribute("orderNumber", orderNumber);
		return "comment";
	}
	
	
	/**	评价商品
	 * @throws IOException */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addComment")
	public void addComment(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		/* 获取请求参数 */
		String userId = ((List<User>)session.getAttribute("users")).get(0).getUserId().toString();
		String goodsId = request.getParameter("goodsId");
		String star = request.getParameter("star");
		String content = request.getParameter("content");
		String orderNumber = request.getParameter("orderNumber");
		
		/* 包装实体类添加评论 */
		Comment comment = new Comment();
		comment.setUserId(userId);
		comment.setGoodsId(goodsId);
		comment.setStar(star);
		comment.setContent(content);
		comment.setOrderNumber(orderNumber);
		goodsService.addComment(comment);
		
		/* 更新订单状态 */
		Order order = new Order();
		order.setStatus("3");
		order.setOrderNumber(orderNumber);
		userService.updateOrder(order);
		
		/* 更新用户的喜好 */
		Preference preference = new Preference();
		preference.setUserId(Integer.parseInt(userId));
		preference.setHot(Integer.parseInt(star));
		// 获取商品类型
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", goodsId);
		Goods goods = goodsService.getGoods(paramMap);
		preference.setBrandType(Integer.parseInt(goods.getType()));
		userService.addPreference(preference);
	}
}
