package co.kr.hungrybunny.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.ShopDAO;
import co.kr.hungrybunny.vo.ShopVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
//	@Override
//	public List<ShopVO> selectShopList() {
//		SqlSession ss = ssf.openSession();
//		List<ShopVO> shopList = ss.selectList("shop.selectShopList");
//		System.out.println("shopList    :   "+shopList);
//		ss.close();
//		return shopList;
//	}
	
	@Override
	public List<ShopVO> selectShopList(int shopCaNo) {
		SqlSession ss = ssf.openSession();
		List<ShopVO> shopList = ss.selectList("shop.selectShopListWithShopCaNo", shopCaNo);
		System.out.println("shopList    :   "+shopList);
		ss.close();
		return shopList;
	}
	
	@Override
	public List<ShopVO> selectConnectionInfoList(int uiNo) {
		SqlSession ss = ssf.openSession();
		List<ShopVO> spList = ss.selectList("shop.selectAdminShop",uiNo);
		return spList;
	}

	@Override
	public List<ShopVO> selectAdminShop(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<ShopVO> slist = ss.selectList("shop.selectAdminHave",shopNo);
		return slist;
	}

}
