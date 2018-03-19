package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.HallVO;

public interface HallDAO {

	public List<HallVO> selectHallList(int shopNo);
	public int updateHallStatusOne(Map<String, Object> map);
	public int updateHallStatusZero(Map<String,Object> map);
}
