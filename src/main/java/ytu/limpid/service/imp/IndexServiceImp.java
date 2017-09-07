package ytu.limpid.service.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ytu.limpid.dao.IndexDao;
import ytu.limpid.entity.Advice;
import ytu.limpid.entity.Goods;
import ytu.limpid.service.IndexService;
@Service
public class IndexServiceImp implements IndexService {
	@Resource
	private IndexDao indexDao;

	public IndexDao getIndexDao() {
		return indexDao;
	}

	public void setIndexDao(IndexDao indexDao) {
		this.indexDao = indexDao;
	}

	@Override
	@Transactional
	public void addAdvice(Advice advice) {
		indexDao.addAdvice(advice);
	}

	@Override
	@Transactional
	public List<Goods> searchBrand(Map<String, String> map) {
		return indexDao.searchBrand(map);
	}
	
	@Override
	@Transactional
	public List<Goods> searchGoods(Map<String, String> map) {
		return indexDao.searchGoods(map);
	}
}
