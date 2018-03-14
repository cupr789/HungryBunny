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
}
