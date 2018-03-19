package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.MenuVO;

public interface MenuService {

	List<MenuVO> getMenuList(int shopNo);
	public int inertMenu(MenuVO mv);
	public int deleteMenu(MenuVO mv,Map<String, Object> map);
	public int checkMenu(int menuNo);
	public int updateMenu(Map<String, Object> map);
	
	// 사장메세지에서 메뉴이름 보기위해 (재형)
	public Map<String,Object> getMenuName(Map<String, Object>map);
}
