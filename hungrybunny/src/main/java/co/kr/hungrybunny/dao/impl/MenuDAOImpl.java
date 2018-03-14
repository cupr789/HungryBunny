package co.kr.hungrybunny.dao.impl;

import java.util.List;

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
		return result;
	}

	@Override
	public List<ReservationMenuVO> checkReservation(int menuNo) {
		SqlSession ss = ssf.openSession();
		List<ReservationMenuVO> list=ss.selectList("menu.checkMenu", menuNo);
		return list;
	}

	@Override
	public int deletetMenu(MenuVO mv) {
		SqlSession ss = ssf.openSession();
		int result=ss.delete("menu.deletetMenu",mv);
		return result;
	}
}
