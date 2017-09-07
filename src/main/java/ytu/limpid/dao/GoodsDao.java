package ytu.limpid.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ytu.limpid.entity.Comment;
import ytu.limpid.entity.Goods;

@Repository
public interface GoodsDao {

	/** ��ȡ���µ�6����Ʒ���� */
	List<Goods> listNewGoods();
	
	void addComment(Comment comment);
	
	Goods getGoods (Map<String, Object> paramMap);
	List<Goods> getGoodsById (Map<String, Object> paramMap);
	
	
	/** ����Ʒ��ID��ѯ��Ʒ */
	List<Goods> getBrandGoods(Map<String, Object> map);
}
