package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.HallVO;

public interface HallDAO {

	List<HallVO> selectHallList(int shopNo);
}
