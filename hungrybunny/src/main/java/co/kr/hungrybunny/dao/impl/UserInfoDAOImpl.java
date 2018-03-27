package co.kr.hungrybunny.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.UserInfoDAO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO{
	@Autowired
	private SqlSessionFactory  ssf;
	
	@Override
	public UserInfoVO selectUserInfo(UserInfoVO ui) {
		SqlSession ss = ssf.openSession();
		ui = ss.selectOne("user_info.selectUserInfo", ui);
		ss.close();
		return ui;
	}

	@Override
	public int insertUserInfo(UserInfoVO ui) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user_info.insertUserInfo", ui);
		ss.close();
		return result;
	
	
}

	@Override
	public int updateUser(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result =ss.update("user_info.updateUserInfo",map);
		ss.close();
		return result;
	}

	@Override
	public int deleteUser(int uiNo) {
		SqlSession ss = ssf.openSession();
		int result =ss.delete("user_info.deleteUserInfo",uiNo);
		ss.close();
		return result;
	}

	
	//재형 2018-03-22 추가함
	@Override
	public List<UserInfoVO> selectAdminID(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		List<UserInfoVO> resultList =ss.selectList("user_info.selectAdminName",map);
		ss.close();
		return resultList;
	}
	@Override
	public List<UserInfoVO> findUserInfo(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		List<UserInfoVO> list=ss.selectList("user_info.findUserInfo", map);
		ss.close();
		return list;
	}

	@Override
	public List<UserInfoVO> checkUiNo(int uiNo) {
		SqlSession ss = ssf.openSession();
		List<UserInfoVO> list=ss.selectList("user_info.checkUiNo", uiNo);
		ss.close();
		return list;
	}

	@Override
	public int updateFindUser(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result=ss.update("user_info.updateFindUser", map);
		ss.close();
		return result;
	}
}
