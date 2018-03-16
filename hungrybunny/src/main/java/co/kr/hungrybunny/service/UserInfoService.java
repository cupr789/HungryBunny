package co.kr.hungrybunny.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import co.kr.hungrybunny.vo.UserInfoVO;

public interface UserInfoService {
	public boolean login(Map<String,Object> rMap, UserInfoVO ui);
	public int join(UserInfoVO ui);
	public int checkUserId(String uiId);
	public void updateUser(Map<String,Object> map,UserInfoVO ui,HttpSession hs);
	public void deleteUser(Map<String,Object> map,UserInfoVO ui);
}
