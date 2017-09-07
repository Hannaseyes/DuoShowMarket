package ytu.limpid.service.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ytu.limpid.dao.BrandDao;
import ytu.limpid.entity.Brand;
import ytu.limpid.entity.BrandType;
import ytu.limpid.service.BrandService;
@Service
public class BrandServiceImp implements BrandService {
	@Resource
	private BrandDao brandDao;

	public BrandDao getBrandDao() {
		return brandDao;
	}

	public void setBrandDao(BrandDao brandDao) {
		this.brandDao = brandDao;
	}

	/** 获取品牌信息列表*/
	@Override
	public List<Brand> listBrand() {
		List<Brand> brandList=brandDao.listBrand();
		return brandList;
	}

	@Override
	public Brand getBrand(Map<String, Object> map) {
		return brandDao.getBrand(map);
	}

	@Override
	public BrandType getBrandType(Map<String, Object> map) {
		return brandDao.getBrandType(map);
	}

	@Override
	public void updateTypeHot(Map<String, Object> map) {
		brandDao.updateTypeHot(map);
	}

}
