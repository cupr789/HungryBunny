package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.ShopVO;

public interface ShopDAO {

	public List<ShopVO> selectConnectionInfoList(int uiNo);
	List<ShopVO> selectShopList(int shopCaNo);
	List<ShopVO> selectAdminShop(int shopNo);
}
