package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.UserInfoVO;

public interface UserInfoDAO {

	public UserInfoVO selectUserInfo(UserInfoVO ui);
	
	public int insertUserInfo(UserInfoVO ui);
	
	public int updateUser(Map<String,Object> map);
	public int deleteUser(int uiNo);
	
	public List<UserInfoVO> selectAdminID(Map<String,Object> map);
	public List<UserInfoVO> findUserInfo(Map<String,Object> map);
	public List<UserInfoVO> checkUiNo(int uiNo);
	public int updateFindUser(Map<String,Object> map);
}
