package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.MenuVO;

public interface MenuDAO {

	List<MenuVO> selectMenuList();
}
