package ytu.limpid.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ytu.limpid.entity.Brand;
import ytu.limpid.entity.Goods;
import ytu.limpid.service.BrandService;
import ytu.limpid.service.GoodsService;
import ytu.limpid.util.ResponseUtil;

/**
 * 品牌操作的controller
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping(value = "/brand")
public class BrandController {
	@Resource
	private BrandService brandService;
	
	@Resource
	private GoodsService goodsService;
	
	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public BrandService getBrandService() {
		return brandService;
	}

	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	@RequestMapping(value = "/brandCtrl")
	public void listBrand(HttpServletResponse response, HttpSession session) throws IOException {
		List<Brand> brandList=brandService.listBrand();
//		session.setAttribute("brandList", brandList);
		ResponseUtil.setResponseList(response, brandList);
	}
	
	/**
	 * 根据品牌ID查询产品
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value = "/getBrandGoods")
	public String getBrandGoods(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("brandId", request.getParameter("brandId"));
		List<Goods> goodsList = goodsService.getBrandGoods(paramMap);
		
		// 查询品牌
		List<Brand> brandList=brandService.listBrand();
		request.setAttribute("newGoodsList", goodsList);
		request.setAttribute("brandList", brandList);
		return "goods";
	}
}
