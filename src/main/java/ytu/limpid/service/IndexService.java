package ytu.limpid.service;

import java.util.List;
import java.util.Map;

import ytu.limpid.entity.Advice;
import ytu.limpid.entity.Goods;

public interface IndexService {
	void addAdvice(Advice advice);
	List<Goods> searchBrand(Map<String, String> map);
	List<Goods> searchGoods(Map<String, String> map);
}
