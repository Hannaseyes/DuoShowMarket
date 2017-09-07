package ytu.limpid.controller;

import java.io.IOException;
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

import ytu.limpid.entity.Advice;
import ytu.limpid.entity.Brand;
import ytu.limpid.entity.Goods;
import ytu.limpid.entity.Preference;
import ytu.limpid.entity.User;
import ytu.limpid.service.BrandService;
import ytu.limpid.service.GoodsService;
import ytu.limpid.service.IndexService;
import ytu.limpid.service.UserService;

/**
 * 用户操作的controller
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController {
	@Resource
	private IndexService indexService;
	@Resource
	private BrandService brandService;
	@Resource
	private UserService userService;
	@Resource
	private GoodsService goodsService;

	/**
	 * 跳转到主页
	 * @return 返回主页
	 */
	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}
	
	/**
	 * 建议反馈
	 * @param adviceContent
	 * @param userId
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/adviceCtrl")
	public void addAdvice(
			@RequestParam(value = "adviceContent") String adviceContent,
			@RequestParam(value = "userId") String userId,
			HttpServletResponse response) throws IOException {
		Advice advice = new Advice();
		advice.setAdviceContent(adviceContent);
		advice.setUserId(Long.parseLong(userId));
		this.indexService.addAdvice(advice);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search")
	public String searchContent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "UTF-8");;
		String type = request.getParameter("type");
		
		Map<String, String> parmMap = new HashMap<String, String>();
		parmMap.put("content", content);
		parmMap.put("type", type);
		List<Goods> resultList = new ArrayList<Goods>();
		if ("brand".equals(type)){
			 resultList = this.indexService.searchBrand(parmMap);
		}else if ("goods".equals(type)){
			 resultList = this.indexService.searchGoods(parmMap);
		}
		
		List<User> users = (List<User>)session.getAttribute("users");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(users!=null && !users.isEmpty()){
			/* 更新用户的喜好 */
			Preference preference = new Preference();
			preference.setUserId(users.get(0).getUserId());
			preference.setHot(3);
			// 获取商品类型
			
			for (Goods resultGoods : resultList) {
				paramMap.put("id", resultGoods.getId());
				Goods goods = goodsService.getGoods(paramMap);
				preference.setBrandType(Integer.parseInt(goods.getType()));
				userService.addPreference(preference);
			}
		}else if("goods".equals(type)){
			for (Goods resultGoods : resultList) {
				paramMap.put("id", resultGoods.getId());
				Goods goods = goodsService.getGoods(paramMap);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", goods.getType());
				map.put("hot", 3);
				brandService.updateTypeHot(map);
			}
		}

	
		// 查询品牌
		List<Brand> brandList=brandService.listBrand();
        request.setAttribute("newGoodsList", resultList);
        request.setAttribute("brandList", brandList);
        
        return "goods";
	}

}
