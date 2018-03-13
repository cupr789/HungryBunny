package co.kr.hungrybunny.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.MenuDAO;
import co.kr.hungrybunny.service.MenuService;
import co.kr.hungrybunny.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDAO menudao;
	
	@Override
	public List<MenuVO> getMenuList(int shopNo) {
		System.out.println("서비스의 menuList : "+menudao.selectMenuList(shopNo));
		return menudao.selectMenuList(shopNo);
	}
}
