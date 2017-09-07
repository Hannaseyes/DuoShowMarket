package ytu.limpid.service;

import java.util.List;
import java.util.Map;

import ytu.limpid.entity.Comment;
import ytu.limpid.entity.Goods;

public interface GoodsService {
	
	List<Goods> listNewGoods();
	
	void addComment(Comment comment);
	
	/**
	 * ���ݲ�����ȡ��Ʒ��Ϣ
	 * @return
	 */
	Goods getGoods(Map<String, Object> paramMap);
	
	List<Goods> getGoodsById(Map<String, Object> paramMap);
	
	
	List<Goods> getBrandGoods(Map<String, Object> map);
}
