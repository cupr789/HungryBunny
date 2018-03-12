package co.kr.hungrybunny.dao;

import co.kr.hungrybunny.vo.UserInfoVO;

public interface UserInfoDAO {

	public UserInfoVO selectUserInfo(UserInfoVO ui);
	
	public int insertUserInfo(UserInfoVO ui);
}
