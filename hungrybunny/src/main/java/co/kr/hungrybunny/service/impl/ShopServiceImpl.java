package co.kr.hungrybunny.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.ShopDAO;
import co.kr.hungrybunny.service.ShopService;
import co.kr.hungrybunny.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO sdao;
	@Override
	public List<ShopVO> getShopList() {
		System.out.println("너 값 어딨어"+sdao.selectShopList());
		return sdao.selectShopList();
	}

}
