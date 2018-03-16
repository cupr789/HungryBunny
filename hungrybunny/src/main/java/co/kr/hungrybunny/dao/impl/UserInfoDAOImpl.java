package co.kr.hungrybunny.dao.impl;

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
		return result;
	}

	@Override
	public int deleteUser(int uiNo) {
		SqlSession ss = ssf.openSession();
		int result =ss.delete("user_info.deleteUserInfo",uiNo);
		return result;
	}
}
