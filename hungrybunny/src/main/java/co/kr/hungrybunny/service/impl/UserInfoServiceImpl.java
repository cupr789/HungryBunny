package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.UserInfoDAO;
import co.kr.hungrybunny.service.UserInfoService;
import co.kr.hungrybunny.vo.UserInfoVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO uidao;

	@Override
	public boolean login(Map<String, Object> rMap, UserInfoVO ui) {

		ui = uidao.selectUserInfo(ui);
		rMap.put("msg", "아이디 비밀번호를 확인해주세요.");
		rMap.put("biz", false);
		if (ui != null) {
			if (ui.getAdmin() == 1) {
				rMap.put("user", ui.getUiId());
				rMap.put("userNo", ui.getUiNo());
				rMap.put("userInfo", ui);
				rMap.put("msg", ui.getUiName() + "사장님 로그인에 성공하셨습니다.");
				rMap.put("aiz", true);
				return true;
			} else if (ui.getAdmin() == 0) {
				rMap.put("user", ui.getUiId());
				rMap.put("userInfo", ui);
				rMap.put("msg", ui.getUiName() + "님 로그인에 성공하셨습니다.");
				rMap.put("biz", true);
				return true;
			} else {
				rMap.put("msg", "사장님인지 아닌지 체크 해주세요^^");
			}
		}
		return false;
	}

	public int checkUserId(String uiId) {
		UserInfoVO ui = new UserInfoVO();
		ui.setUiId(uiId);
		if (uidao.selectUserInfo(ui) != null) {
			return 1;
		}
		return 0;
	}

	@Override
	public int join(UserInfoVO ui) {
		if (checkUserId(ui.getUiId()) == 1) {
			return 2;
		}
		return uidao.insertUserInfo(ui);
	}

	@Override
	public void updateUser(Map<String, Object> map, UserInfoVO ui,HttpSession hs) {
		String checkPwd = map.get("check").toString();
		String check = map.get("uiId").toString();
		String checkId="";
		if(check.equals(ui.getUiId())) {
		checkId="";
		}else {
		checkId=map.get("uiId").toString();
		}
		int result = checkUserId(checkId);
		if(checkPwd.equals(ui.getUiPwd())) {
			if(result==0) {
				int faiResualt=uidao.updateUser(map);
				if(faiResualt==1) {
					map.put("msg","수정성공이요 로그인부터 다시해주세요^^");
					map.put("biz",true);
					hs.invalidate();
				}else {
					map.put("msg","서버오류..관리자에게 문의바람");
				}
			}else {
				map.put("msg","사용할수 없는 아이디 입니다.");
			}
			
		}else {
			map.put("msg","비밀번호가 일치하지 않습니다");
		}
		
	}

	@Override
	public int deleteUser(Map<String, Object> map, UserInfoVO ui) {
		String uiPwd = map.get("check").toString();
		if (uiPwd.equals(ui.getUiPwd())) {
			String str = map.get("uiNo").toString();
			int uiNo = Integer.parseInt(str);
			int result = uidao.deleteUser(uiNo);
			if (result == 1) {
				map.put("msg", "이런....매정한사람....");
				map.put("biz",true);
				return 1;
			} else {
				map.put("msg", "관리자에게 문의바랍니다 ㅜㅜ ");
				return 0;
			}
		} else {
			map.put("msg", "비밀번호를 잘못입력했어요 ㅜㅜ ");
			return 0;
		}
		
	}
}
