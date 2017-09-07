package ytu.limpid.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ytu.limpid.entity.Brand;
import ytu.limpid.entity.BrandType;
import ytu.limpid.entity.Goods;
import ytu.limpid.service.BrandService;
import ytu.limpid.service.GoodsService;
/**
 * 进行页面跳转定位的Controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/page")
public class PageController {
	
	@Resource
	private GoodsService goodsService;
	
	@Resource
	private BrandService brandService;

	public GoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	
	@RequestMapping(value = "/registration")
	public String registration() {
		return "registration";
	}
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/about")
	public String about() {
		return "about";
	}
	
	@RequestMapping(value = "/blog")
	public String blog() {
		return "blog";
	}
	@RequestMapping(value = "/cart")
	public String cart() {
		return "cart";
	}
	
	/* 获取商品列表 */
	@RequestMapping(value = "/goods")
	public String goods(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 查询品牌
		List<Brand> brandList=brandService.listBrand();
		// 查询商品
		List<Goods> newGoodsList = goodsService.listNewGoods();
		
		// 返回数据
		request.setAttribute("brandList", brandList);
		request.setAttribute("newGoodsList", newGoodsList);
		return "goods";
	}
	
	/* 获取商品详情 */
	@RequestMapping(value = "/single")
	public String single(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", request.getParameter("id"));
		Goods goods = goodsService.getGoods(paramMap);
		
		paramMap.put("id", goods.getBrandId());
		Brand brand = brandService.getBrand(paramMap);
		
		paramMap.put("id", goods.getType());
		BrandType brandType = brandService.getBrandType(paramMap);
		request.setAttribute("goods", goods);
		request.setAttribute("brand", brand);
		request.setAttribute("brandType", brandType);
		return "single";
	}
	
	@RequestMapping(value = "/error")
	public String error() {
		return "error";
	}
}
