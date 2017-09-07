package ytu.limpid.service;

import java.util.List;
import java.util.Map;

import ytu.limpid.entity.Comment;
import ytu.limpid.entity.Goods;

public interface GoodsService {
	
	List<Goods> listNewGoods();
	
	void addComment(Comment comment);
	
	/**
	 * 根据参数获取商品信息
	 * @return
	 */
	Goods getGoods(Map<String, Object> paramMap);
	
	List<Goods> getGoodsById(Map<String, Object> paramMap);
	
	
	List<Goods> getBrandGoods(Map<String, Object> map);
}
