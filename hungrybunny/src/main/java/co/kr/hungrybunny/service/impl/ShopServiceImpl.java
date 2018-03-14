package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.ShopDAO;
import co.kr.hungrybunny.service.ShopService;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO sdao;
	
	@Override
	public List<ShopVO> getShopList(int shopCaNo) {
		System.out.println("너 값 어딨어"+sdao.selectShopList(shopCaNo));
		return sdao.selectShopList(shopCaNo);
	}
	
	@Override
	public List<ShopVO> getConnectionInfoList(UserInfoVO ui) {
		List<ShopVO> sList = sdao.selectConnectionInfoList(ui.getUiNo());
		return sList;
	}

	@Override
	public List<ShopVO> getAdminShop(int shopNo) {
		
		return sdao.selectAdminShop(shopNo);
	}

}
