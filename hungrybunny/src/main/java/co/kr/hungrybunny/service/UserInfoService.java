package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import co.kr.hungrybunny.vo.UserInfoVO;

public interface UserInfoService {
	public boolean login(Map<String,Object> rMap, UserInfoVO ui);
	public int join(UserInfoVO ui);
	public int checkUserId(String uiId);
	public void updateUser(Map<String,Object> map,UserInfoVO ui,HttpSession hs);
	public int deleteUser(Map<String,Object> map,UserInfoVO ui);

	
	//재형 2018-03-22
	public String getAdminID(Map<String,Object> map);

}
