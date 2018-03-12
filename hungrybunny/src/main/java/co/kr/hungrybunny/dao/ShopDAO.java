package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.ShopVO;

public interface ShopDAO {

	List<ShopVO> selectShopList(int shopCaNo);
}
