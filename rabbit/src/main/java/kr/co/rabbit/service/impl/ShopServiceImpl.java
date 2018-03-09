package kr.co.rabbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rabbit.dao.ShopDAO;
import kr.co.rabbit.service.ShopService;
import kr.co.rabbit.vo.ShopVO;

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
