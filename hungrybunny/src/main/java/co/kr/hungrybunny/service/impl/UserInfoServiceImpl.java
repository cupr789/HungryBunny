package co.kr.hungrybunny.service.impl;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.UserInfoDAO;
import co.kr.hungrybunny.service.UserInfoService;
import co.kr.hungrybunny.vo.UserInfoVO;
@Service
public class UserInfoServiceImpl implements UserInfoService{
	
	@Autowired
	private UserInfoDAO uidao;
	
	@Override
	public boolean login(Map<String, Object> rMap, UserInfoVO ui) {
		
		
		ui = uidao.selectUserInfo(ui);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~"+ui);
		rMap.put("msg", "아이디 비밀번호를 확인해주세요.");
		rMap.put("biz", false);
		if(ui!=null) {
			if(ui.getAdmin()==1) {
				rMap.put("user", ui.getUiId());
				rMap.put("userNo", ui.getUiNo());
				rMap.put("userInfo", ui);
				rMap.put("msg", ui.getUiName() + "사장님 로그인에 성공하셨습니다.");
				rMap.put("aiz", true);
				return true;
			}else if(ui.getAdmin()==0) {
			rMap.put("user", ui.getUiId());
			rMap.put("userInfo", ui);
			rMap.put("msg", ui.getUiName() + "님 로그인에 성공하셨습니다.");
			rMap.put("biz", true);
			return true;
			}else {
				rMap.put("msg", "사장님인지 아닌지 체크 해주세요^^");
			}
		}
		return false;
	}

	public int checkUserId(String uiId) {
		UserInfoVO ui = new UserInfoVO();
		ui.setUiId(uiId);
		if(uidao.selectUserInfo(ui)!=null){
			return 1;
		}
		return 0;
	}
	
	@Override
	public int join(UserInfoVO ui) {
		if(checkUserId(ui.getUiId())==1) {
			return 2;
		}
		return uidao.insertUserInfo(ui);
	}
}
