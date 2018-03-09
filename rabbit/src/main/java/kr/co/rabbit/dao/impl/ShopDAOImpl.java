package kr.co.rabbit.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rabbit.dao.ShopDAO;
import kr.co.rabbit.vo.ShopVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public List<ShopVO> selectShopList() {
		SqlSession ss = ssf.openSession();
		List<ShopVO> shopList = ss.selectList("shop.selectKShopList");
		System.out.println("KShopList    :   "+shopList);
		ss.close();
		return shopList;
	}

}
