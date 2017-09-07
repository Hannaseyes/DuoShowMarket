package ytu.limpid.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ytu.limpid.entity.Brand;
import ytu.limpid.entity.BrandType;
@Repository
public interface BrandDao {
	List<Brand> listBrand();//��ѯƷ���б�
	
	Brand getBrand(Map<String, Object> map);// ��ȡƷ����Ϣ
	
	BrandType getBrandType(Map<String, Object> map);// ��ȡƷ������
	/** �������͵��ȶ� */
	void updateTypeHot(Map<String, Object> map);
}
