package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.MenuDAO;
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
		if(num==2) {
			map.put("msg","예약된메뉴입니다....");
			return 2;
		}else {
			
			return menudao.insertMenu(mv);
		}
		
	
	}

	@Override
	public int checkMenu(int menuNo) {
		List<ReservationMenuVO> list=menudao.checkReservation(menuNo);
		if(list!=null) {
			return 1;
		}
		return 2;
	}
}
