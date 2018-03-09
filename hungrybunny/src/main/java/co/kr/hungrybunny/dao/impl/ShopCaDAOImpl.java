package co.kr.hungrybunny.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.ShopCaDAO;
import co.kr.hungrybunny.vo.ShopCaVO;
import co.kr.hungrybunny.vo.ShopVO;

@Repository
public class ShopCaDAOImpl implements ShopCaDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public List<ShopCaVO> selectCaList() {
		SqlSession ss = ssf.openSession();
		List<ShopCaVO> caList = ss.selectList("category.caList");
		ss.close();
		return caList;
	}
}
