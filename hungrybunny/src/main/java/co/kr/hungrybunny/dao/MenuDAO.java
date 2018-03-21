package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ReservationMenuVO;

public interface MenuDAO {

	List<MenuVO> selectMenuList(int shopNo);
	public int insertMenu(MenuVO mv);
	List<ReservationMenuVO> checkReservation(int menuNo);
	public int deleteMenu(MenuVO mv);
	public int updateMenu(Map<String, Object> map);
	
	// 사장메세지에서 메뉴이름 보기위해 (재형)
	public List<String> selectMenuName(Map<String,Object> map);
}
