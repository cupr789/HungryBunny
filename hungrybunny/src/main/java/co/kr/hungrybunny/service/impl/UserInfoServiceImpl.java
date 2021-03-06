package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.UserInfoDAO;
import co.kr.hungrybunny.service.UserInfoService;
import co.kr.hungrybunny.utils.PasswdUtil;
import co.kr.hungrybunny.vo.UserInfoVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO uidao;
	PasswdUtil pu= new PasswdUtil();

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
				rMap.put("msg", "사장님인지 아닌지 체크 해주세요");
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
	public int checkEmail(String uiEmail) {
		UserInfoVO ui = new UserInfoVO();
		ui.setUiEmail(uiEmail);
		if(uidao.checkEmail(ui) != null) {
			return 1;
		}
				
		return 0;
	}
	@Override
	public int join(UserInfoVO ui) {
		if (checkUserId(ui.getUiId()) == 1) {
			return 2;
		}
		if (checkEmail(ui.getUiEmail())==1) {
			return 2;
		}
		return uidao.insertUserInfo(ui);
	}

	@Override
	public void updateUser(Map<String, Object> map, UserInfoVO ui,HttpSession hs) {
		PasswdUtil pu= new PasswdUtil();
		String pwd = map.get("check").toString();
		String checkPwd=pu.makePasswd(pwd)+"SMH!";
		String pwd2 = map.get("uiPwd").toString();
		if(pwd2.length()>30) {
			map.put("uiPwd",pwd2);	
		}else {
			String uiPwd=pu.makePasswd(pwd2)+"SMH!";
			map.put("uiPwd",uiPwd);	
		}
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
					map.put("msg","수정성공이요 로그인부터 다시해주세요");
					map.put("biz",true);
					hs.invalidate();
				}else if(faiResualt==0){
					map.put("biz",true);
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
		PasswdUtil pu= new PasswdUtil();
		String Pwd = map.get("check").toString();
		String uiPwd=pu.makePasswd(Pwd)+"SMH!";
		if (uiPwd.equals(ui.getUiPwd())) {
			String str = map.get("uiNo").toString();
			int uiNo = Integer.parseInt(str);
			int result = uidao.deleteUser(uiNo);
			if (result == 1) {
				map.put("msg", "정상적으로 회원탈퇴 되었습니다");
				map.put("biz",true);
				return 1;
			} else {
				map.put("msg", "관리자에게 문의바랍니다 ");
				return 0;
			}
		} else {
			map.put("msg", "비밀번호를 잘못입력했어요");
			return 0;
		}
		
	}

	
	//재형 2018-03-22 추가
	@Override
	public String getAdminID(Map<String, Object> map) {
		System.out.println(map+"   serviceImpl");
		List<UserInfoVO> resultList = uidao.selectAdminID(map);
		return resultList.get(0).getUiId();
	}
	@Override
	public List<UserInfoVO> findUserInfo( Map<String, Object> map) {
		List<UserInfoVO> list=uidao.findUserInfo(map);
		return list;
	}

	@Override
	public List<UserInfoVO> checkUiNo(int uiNo) {
		List<UserInfoVO> list=uidao.checkUiNo(uiNo);
		return list;
	}

	@Override
	public void updateFindUser(Map<String, Object> map, HttpSession hs) {
		
		
		
		int result =uidao.updateFindUser(map);
		if(result==1) {
			map.put("msg","변경성공입니다.");
			map.put("biz",true);
			hs.invalidate();
		}else {
			map.put("msg","서버오류 관리자에게 문의 해주세요");
		}
		
	}
}
