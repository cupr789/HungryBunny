package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

public interface ResService {

	public int insertRes(Map<String,Object> map);
	public List<Object> getConfirmRes(int uiNo);
}
