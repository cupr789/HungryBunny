package co.kr.hungrybunny.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import co.kr.hungrybunny.dao.AdminResDAO;
import co.kr.hungrybunny.service.AdaminResService;


@Service
public class AdminResServiceImpl implements AdaminResService{
	
	@Autowired
	private AdminResDAO ardao; 

	@Override
	public List<Object> getAdminShop(int shopNo,Map<String, Object> map) {
		Gson gson= new Gson();
		List<Object> hallList=ardao.selectShophall(shopNo);
		List<Object> list=ardao.selectAdminShop(shopNo);
		System.out.println("/*/*/*//*/*/*/*/*/*/"+hallList);
		map.put("msg","들어왔어요");
		map.put("reslist",gson.toJson(list));
		map.put("hallList",hallList);
		return list;
	}

	@Override
	public void updateHall(Map<String, Object> map) {
		
	
	}

}
