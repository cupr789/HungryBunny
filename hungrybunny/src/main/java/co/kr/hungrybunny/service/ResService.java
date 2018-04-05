package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.ReservationVO;

public interface ResService {

	public int insertRes(Map<String,Object> map);
	public List<ReservationVO> getConfirmRes(int uiNo);
	public int cancleRes(Map<String,Integer> map);
}
