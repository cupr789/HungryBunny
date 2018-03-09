package kr.co.rabbit.dao;

import java.util.List;

import kr.co.rabbit.vo.MenuVO;

public interface MenuDAO {

	List<MenuVO> selectMenuList();
}
