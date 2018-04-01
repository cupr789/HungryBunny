package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;



public interface AdminResDAO {

	List<Object> selectAdminShop(Map<String, Object> map);
	public Integer selectAdminShopTotalCnt(Map<String, Object> map);
	List<Object> selectShophall(Map<String, Object> map);
	int updateHall(Map<String, Integer> pmap);
}
