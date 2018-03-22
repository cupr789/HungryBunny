package co.kr.hungrybunny.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.MenuDAO;
import co.kr.hungrybunny.dao.impl.MenuDAOImpl;
import co.kr.hungrybunny.service.MenuService;
import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ReservationMenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDAO menudao;
	
	@Override
	public List<MenuVO> getMenuList(int shopNo) {
		System.out.println("서비스의 menuList : "+menudao.selectMenuList(shopNo));
		return menudao.selectMenuList(shopNo);
	}
	
	@Override
	public int inertMenu(MenuVO mv) {
		
		return menudao.insertMenu(mv);
	}

	@Override
	public int deleteMenu(MenuVO mv,Map<String, Object> map) {
		int num=checkMenu(mv.getMenuNo());
		System.out.println("~~~~~~~~~~~~~"+num);
		System.out.println("@@@@@@@@@@@@@@@@@@@"+mv.getMenuNo());
		if(num==2) {
			map.put("msg","예약된메뉴입니다....");
			return 2;
		}else {
			return menudao.deleteMenu(mv);
		}
		
	
	}

	@Override
	public int checkMenu(int menuNo) {
		List<ReservationMenuVO> list=menudao.checkReservation(menuNo);
		if(!list.isEmpty()) {
			return 2;
		}
		return 1;
	}

	@Override
	public int updateMenu(Map<String, Object> map) {
		int num=checkMenu((Integer) map.get("menuNo"));
		if(num==2) {
			map.put("msg","예약된메뉴입니다....");
			return 2;
		}else {
			return menudao.updateMenu(map);
		}
		
	}
	
	
	
	// 사장메세지에서 메뉴이름 보기위해 (재형)
	@Override
	public Map<String, List<String>> getMenuName(Map<String, Object> map) {
		System.out.println();
		ArrayList<String> msList = (ArrayList<String>) menudao.selectMenuName(map);
		List<String> tesrt = (List<String>) map.get("menuCntArr");
		
		Map<String, List<String>> resultMap = new HashMap<String, List<String>>();
		resultMap.put("msList", msList);
		resultMap.put("tesrt", tesrt);
		return resultMap;
	}
}
