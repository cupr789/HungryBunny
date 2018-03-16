package co.kr.hungrybunny.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.AdminResDAO;
import co.kr.hungrybunny.service.AdaminResService;


@Service
public class AdminResServiceImpl implements AdaminResService{
	
	@Autowired
	private AdminResDAO ardao; 

	@Override
	public List<Object> getAdminShop(int shopNo) {
		List<Object> list=ardao.selectAdminShop(shopNo);
		return list;
	}

}
