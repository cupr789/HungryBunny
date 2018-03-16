package co.kr.hungrybunny.dao;

import java.util.Map;

import co.kr.hungrybunny.vo.UserInfoVO;

public interface UserInfoDAO {

	public UserInfoVO selectUserInfo(UserInfoVO ui);
	
	public int insertUserInfo(UserInfoVO ui);
	
	public int updateUser(Map<String,Object> map);
	public int deleteUser(int uiNo);
}
