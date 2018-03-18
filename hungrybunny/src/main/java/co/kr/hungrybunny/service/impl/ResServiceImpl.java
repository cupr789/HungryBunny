package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.ResDAO;
import co.kr.hungrybunny.service.ResService;

@Service
public class ResServiceImpl implements ResService{
	
	@Autowired
	private ResDAO rdao;

	@Override
	public int insertRes(Map<String, Object> map) {
		int insertResResult = rdao.insertRes(map);
		int insertResResultMenu = rdao.insertResMenu(map);
		if(insertResResult==1 && insertResResultMenu==1) {
			return 1;
		}
		return 0;
	}

	@Override
	public List<Object> getConfirmRes(int uiNo){
		return rdao.selectConfirmRes(uiNo);
	}
}
