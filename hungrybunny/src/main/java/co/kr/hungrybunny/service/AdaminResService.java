package co.kr.hungrybunny.service;



import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.AdminResVO;

public interface AdaminResService {

	
	List<Object> getAdminShop(Map<String, Object> map);
	public Integer getAdminShopTotalCnt(Map<String, Object> map);
	public int updateHall(Map<String, Object> map);
}
