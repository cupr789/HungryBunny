package co.kr.hungrybunny.service.impl;


import java.util.HashMap;
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
		map.put("currentStatus",map.get("hallStatus"));
		String str1= map.get("hallStatus").toString();
		int hallStatus=Integer.parseInt(str1);
		String str2=map.get("hallNo").toString();
		int hallNo=Integer.parseInt(str2);
		String str3=map.get("currentStatus").toString();
		int currentStatus=Integer.parseInt(str3);
		Map<String,Integer> pmap=new HashMap<String,Integer>();
		pmap.put("hallStatus", hallStatus);
		pmap.put("hallNo", hallNo);
		pmap.put("currentStatus", currentStatus);
		
		int result=ardao.updateHall(pmap);
	
	
	}

}
