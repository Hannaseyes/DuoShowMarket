package ytu.limpid.service;

import java.util.List;
import java.util.Map;

import ytu.limpid.entity.Brand;
import ytu.limpid.entity.BrandType;

public interface BrandService {
	List<Brand> listBrand();
	
	Brand getBrand(Map<String, Object> map);
	
	BrandType getBrandType(Map<String, Object> map);
	/** �������͵��ȶ� */
	void updateTypeHot(Map<String, Object> map);
}
