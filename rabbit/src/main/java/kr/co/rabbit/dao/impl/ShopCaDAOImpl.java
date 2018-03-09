package kr.co.rabbit.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rabbit.dao.ShopCaDAO;
import kr.co.rabbit.vo.ShopCaVO;
import kr.co.rabbit.vo.ShopVO;

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
