package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.HallVO;



public interface AdminResDAO {

	List<Object> selectAdminShop(Map<String, Object> map);
	public Integer selectAdminShopTotalCnt(Map<String, Object> map);
	List<HallVO> hallInfo(Map<String, Object> map);
	public Integer hallTotalCnt(Map<String, Object> map);
	List<Object> selectShophall(Map<String, Object> map);
	int updateHall(Map<String, Integer> pmap);
	int insertHall(Map<String, Object> map);
	int deleteHall(Map<String, Object> map);
}
