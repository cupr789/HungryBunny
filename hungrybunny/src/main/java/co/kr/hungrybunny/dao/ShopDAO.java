package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.ShopVO;

public interface ShopDAO {

	public List<ShopVO> selectConnectionInfoList(int uiNo);
	List<ShopVO> selectShopList(int shopCaNo);
	List<ShopVO> selectAdminShop(int shopNo);
	
	
	
	
	
	
	// 재형 추가함
	List<ShopVO> selectConditionShop(Map<String, Object> map);
}
