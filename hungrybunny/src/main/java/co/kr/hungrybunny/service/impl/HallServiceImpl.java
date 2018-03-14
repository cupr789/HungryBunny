package co.kr.hungrybunny.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.HallDAO;
import co.kr.hungrybunny.service.HallService;

@Service
public class HallServiceImpl implements HallService{

	@Autowired
	private HallDAO hdao;
	
	@Override
	public Map<String, Object> getResList(int shopNo) {
		return hdao.selectResList(shopNo);
	}

}
