package co.kr.hungrybunny.service;

import java.util.List;

import co.kr.hungrybunny.vo.MenuVO;

public interface MenuService {

	List<MenuVO> getMenuList(int shopNo);
}
