package co.kr.hungrybunny.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.HallDAO;
import co.kr.hungrybunny.dao.MenuDAO;
import co.kr.hungrybunny.dao.PayCaDAO;
import co.kr.hungrybunny.service.HallService;

@Service
public class HallServiceImpl implements HallService{

	@Autowired
	private HallDAO hdao;
	@Autowired
	private MenuDAO mdao;
	@Autowired
	private PayCaDAO pdao;
	
	@Override
	public Map<String,Object> getCheckOption(int shopNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hallList", hdao.selectHallList(shopNo));
		map.put("menuList", mdao.selectMenuList(shopNo));
		map.put("payCaList", pdao.selectPayCa());
		return map;
	}
}
