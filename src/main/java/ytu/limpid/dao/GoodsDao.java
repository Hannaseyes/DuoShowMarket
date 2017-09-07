package ytu.limpid.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ytu.limpid.entity.Comment;
import ytu.limpid.entity.Goods;

@Repository
public interface GoodsDao {

	/** 获取最新的6条商品数据 */
	List<Goods> listNewGoods();
	
	void addComment(Comment comment);
	
	Goods getGoods (Map<String, Object> paramMap);
	List<Goods> getGoodsById (Map<String, Object> paramMap);
	
	
	/** 根据品牌ID查询商品 */
	List<Goods> getBrandGoods(Map<String, Object> map);
}
