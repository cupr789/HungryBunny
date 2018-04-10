package co.kr.hungrybunny.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.AdminResDAO;
import co.kr.hungrybunny.dao.HallDAO;
import co.kr.hungrybunny.dao.ResDAO;
import co.kr.hungrybunny.dao.ReviewDAO;
import co.kr.hungrybunny.service.ResService;
import co.kr.hungrybunny.vo.ReservationVO;

@Service
public class ResServiceImpl implements ResService{
	
	@Autowired
	private ResDAO rdao;
	@Autowired
	private HallDAO hdao;
	@Autowired
	private AdminResDAO ardao;
	@Autowired
	private ReviewDAO rvdao;

	@Override
	public int insertRes(Map<String, Object> map) {
		int insertResResult = rdao.insertRes(map);
		int insertResMenuResult = rdao.insertResMenu(map);
		int updateHallStatusToOne = hdao.updateHallStatusOne(map);
		if(insertResResult==1 && insertResMenuResult>0 && updateHallStatusToOne==1) {
			return 1;
		}
		return 0;
	}

	@Override
	public List<ReservationVO> getConfirmRes(int uiNo){
		List<ReservationVO> resList = rdao.selectConfirmRes(uiNo);
		return resList;
	}

	@Override
	public int cancleRes(Map<String,Integer> map) {
		// hall update, delete resmenu, res
		
		
		//재형 수정중 2018-03-30
		
		//ardao.updateHall(map);
		int updateHallResult = ardao.updateHall(map);
		//int deleteResMenuResult = rdao.deleteResMenu(map);
		//int deleteResResult = rdao.deleteRes(map);
		if(updateHallResult==1) {
			return 1;
		}
		return 0;
	}
}
