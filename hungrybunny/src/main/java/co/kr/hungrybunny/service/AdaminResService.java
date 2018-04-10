package co.kr.hungrybunny.service;



import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.AdminResVO;
import co.kr.hungrybunny.vo.HallVO;

public interface AdaminResService {

	
	List<Object> getAdminShop(Map<String, Object> map);
	public Integer getAdminShopTotalCnt(Map<String, Object> map);
	List<HallVO> hallInfo(Map<String, Object> map);
	public Integer hallTotalCnt(Map<String, Object> map);
	public int updateHall(Map<String, Object> map);
	void insertHall(Map<String, Object> map);
	void deleteHall(Map<String, Object> map);
	
}
