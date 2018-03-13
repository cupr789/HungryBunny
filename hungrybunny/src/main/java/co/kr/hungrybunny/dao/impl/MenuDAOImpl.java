package co.kr.hungrybunny.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.MenuDAO;
import co.kr.hungrybunny.vo.MenuVO;

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

}
