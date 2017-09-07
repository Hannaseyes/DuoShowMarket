package ytu.limpid.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ytu.limpid.entity.Advice;
import ytu.limpid.entity.Goods;
@Repository
public interface IndexDao {
	void addAdvice(Advice advice);
	List<Goods> searchBrand(Map<String, String> map);
	List<Goods> searchGoods(Map<String, String> map);
}
