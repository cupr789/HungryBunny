package co.kr.hungrybunny.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.AdminResDAO;

@Repository
public class AdminResDAOImpl implements AdminResDAO{
	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public List<Object> selectAdminShop(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<Object> list= ss.selectList("adminres.selectAdminHave",shopNo);
		ss.close();
		return list;
	}

	@Override
	public List<Object> selectShophall(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<Object> list=ss.selectList("adminres.selecthall",shopNo);
		ss.close();
		return list;
	}

	@Override
	public int updateHall(Map<String, Object> map) {
		
		return 0;
	}

}
