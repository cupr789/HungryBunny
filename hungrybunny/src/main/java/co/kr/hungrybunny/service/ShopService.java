package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

public interface ShopService {

	public List<ShopVO> getConnectionInfoList(UserInfoVO ui);
	List<ShopVO> getShopList(int shopCaNo);
	List<ShopVO> getAdminShop(Map<String,Object> map);
}
