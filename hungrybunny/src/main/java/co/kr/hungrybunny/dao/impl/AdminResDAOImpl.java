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
	public List<Object> selectAdminShop(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		List<Object> list= ss.selectList("adminres.selectAdminHave",map);
		ss.close();
		return list;
	}

	@Override
	public Integer selectAdminShopTotalCnt(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int adminShopTotalCnt = ss.selectOne("adminres.selectAdminHaveTotalCnt",map);
		System.out.println("adminShopTotalCnt????????????????"+adminShopTotalCnt);
		ss.close();
		return adminShopTotalCnt;
	}

	@Override
	public List<Object> selectShophall(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		List<Object> list=ss.selectList("adminres.selecthall",map);
		ss.close();
		return list;
	}

	@Override
	public int updateHall(Map<String, Integer> pmap) {
		SqlSession ss = ssf.openSession();
		int result=ss.update("adminres.updateHall", pmap);
		System.out.println("llllll           "     +result);
		return result;
	}

	@Override
	public List<Object> hallInfo(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		List<Object> list=ss.selectList("adminres.hallInfo", map);
		ss.close();
		return list;
	}

	@Override
	public Integer hallTotalCnt(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result=ss.selectOne("adminres.hallTotalCnt", map);
		ss.close();
		return result;
	}

	@Override
	public int insertHall(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result=ss.insert("adminres.insertHall", map);
		ss.close();
		return result;
	}

	@Override
	public int deleteHall(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result=ss.delete("adminres.deleteHall", map);
		ss.close();
		return result;
	}
}
