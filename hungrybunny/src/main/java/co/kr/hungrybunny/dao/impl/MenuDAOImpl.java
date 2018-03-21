package co.kr.hungrybunny.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import co.kr.hungrybunny.dao.MenuDAO;
import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ReservationMenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public List<MenuVO> selectMenuList(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<MenuVO> menuList = ss.selectList("menu.selectMenuList", shopNo);
		System.out.println("다오의 menuList : "+menuList);
		ss.close();
		return menuList;
	}

	@Override
	public int insertMenu(MenuVO mv) {
		SqlSession ss = ssf.openSession();
		int result=ss.insert("menu.insertMenu",mv);
		ss.close();
		return result;
	}

	@Override
	public List<ReservationMenuVO> checkReservation(int menuNo) {
		SqlSession ss = ssf.openSession();
		List<ReservationMenuVO> list=ss.selectList("menu.checkMenu", menuNo);
		System.out.println("xml에서 뱉어준 list"+list);
		ss.close();
		return list;
	}

	@Override
	public int deleteMenu(MenuVO mv) {
		SqlSession ss = ssf.openSession();
		int result=ss.delete("menu.deleteMenu",mv);
		ss.close();
		return result;
	}

	@Override
	public int updateMenu(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result=ss.update("menu.updateMenu",map);
		ss.close();
		return result;
	}

	
	// 사장메세지에서 메뉴이름 보기위해 (재형)
	@Override
	public List<String> selectMenuName(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();

		 List<String> menuNameList = ss.selectList("menu.adminMsgMenuName", map);
		System.out.println(menuNameList);
		ss.close();
		return menuNameList;
	}
}
