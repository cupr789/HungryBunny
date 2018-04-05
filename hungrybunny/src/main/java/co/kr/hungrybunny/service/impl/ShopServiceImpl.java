package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.ReviewDAO;
import co.kr.hungrybunny.dao.ShopDAO;
import co.kr.hungrybunny.service.ShopService;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO sdao;
	@Autowired
	private ReviewDAO rdao;
	
	
	//2018-04-05 혜진 수정함
	@Override
	public List<ShopVO> getShopList(int shopCaNo) {
		List<ShopVO> shopList = sdao.selectShopList(shopCaNo);
		int reviewRatingAvg = 0;
		for(int i=0;i<shopList.size();i++) {
			reviewRatingAvg = rdao.selectReviewRating(shopList.get(i).getShopNo());
			shopList.get(i).setReviewRatingAvg(reviewRatingAvg);
			System.out.println("여기서 shopList를 뽑자"+shopList);
		}
		return shopList;
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

	
	// 재형이 추가함
	@Override
	public List<ShopVO> getConditionShop(Map<String, Object> map) {
		
		return null;
	}



}
