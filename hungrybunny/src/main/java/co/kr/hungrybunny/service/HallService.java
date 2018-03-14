package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.HallVO;

public interface HallService {
	Map<String,Object> getCheckOption(int shopNo);
}
