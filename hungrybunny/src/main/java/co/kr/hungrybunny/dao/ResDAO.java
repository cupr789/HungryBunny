package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

public interface ResDAO {

	public int insertRes(Map<String,Object> map);
	public int insertResMenu(Map<String, Object> map);
	public List<Object> selectConfirmRes(int uiNo);
}
