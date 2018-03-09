package kr.co.rabbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rabbit.dao.MenuDAO;
import kr.co.rabbit.service.MenuService;
import kr.co.rabbit.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDAO menudao;
	
	@Override
	public List<MenuVO> getMenuList() {
		System.out.println(menudao.selectMenuList());
		return menudao.selectMenuList();
	}
}
