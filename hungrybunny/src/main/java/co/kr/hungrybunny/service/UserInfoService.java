package co.kr.hungrybunny.service;

import java.util.Map;

import co.kr.hungrybunny.vo.UserInfoVO;

public interface UserInfoService {
	public boolean login(Map<String,Object> rMap, UserInfoVO ui);
	public int join(UserInfoVO ui);
	public int checkUserId(String uiId);
	public void updateUser(Map<String,Object> Map,UserInfoVO ui);
}
