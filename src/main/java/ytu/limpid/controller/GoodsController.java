package ytu.limpid.controller;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ytu.limpid.entity.Goods;
import ytu.limpid.service.GoodsService;
import ytu.limpid.util.ResponseUtil;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {
	
	@Resource
	private GoodsService goodsService;
	
	/**	获取最新的6条商品数据 
	 * @throws IOException */
	@RequestMapping(value = "/listNewGoods")
	public String listNewGoods(HttpServletResponse response, HttpSession session) throws IOException{
		
		List<Goods> newGoodsList = goodsService.listNewGoods();
		ResponseUtil.setResponseList(response, newGoodsList);
		//System.out.println(newGoodsList.toString());
		return "index";
	}
}
