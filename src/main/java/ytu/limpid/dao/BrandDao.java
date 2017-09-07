package ytu.limpid.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ytu.limpid.entity.Brand;
import ytu.limpid.entity.BrandType;
@Repository
public interface BrandDao {
	List<Brand> listBrand();//查询品牌列表
	
	Brand getBrand(Map<String, Object> map);// 获取品牌信息
	
	BrandType getBrandType(Map<String, Object> map);// 获取品牌类型
	/** 增加类型的热度 */
	void updateTypeHot(Map<String, Object> map);
}
