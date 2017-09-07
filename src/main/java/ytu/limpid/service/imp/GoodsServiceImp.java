package ytu.limpid.service.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ytu.limpid.dao.GoodsDao;
import ytu.limpid.entity.Comment;
import ytu.limpid.entity.Goods;
import ytu.limpid.service.GoodsService;

@Service
public class GoodsServiceImp implements GoodsService{

	@Resource
	private GoodsDao goodsDao;
	
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	@Override
	public List<Goods> listNewGoods() {
		List<Goods> newGoodsList = goodsDao.listNewGoods();
		return newGoodsList;
	}

	@Override
	public void addComment(Comment comment) {
		goodsDao.addComment(comment);
	}

	@Override
	public Goods getGoods(Map<String, Object> paramMap) {
		return goodsDao.getGoods(paramMap);
	}

	@Override
	public List<Goods> getGoodsById(Map<String, Object> paramMap) {
		return goodsDao.getGoodsById(paramMap);
	}
	
	@Override
	public List<Goods> getBrandGoods(Map<String, Object> map) {
		return goodsDao.getBrandGoods(map);
	}
}
