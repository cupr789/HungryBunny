package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.ReservationVO;

public interface ResDAO {

	public int insertRes(Map<String,Object> map);
	public int insertResMenu(Map<String, Object> map);
	public List<ReservationVO> selectConfirmRes(int uiNo);
	public int deleteResMenu(Map<String,Object> map);
	public int deleteRes(Map<String,Object> map);
	public int updateResStatus(Map<String,Object> map);
}
