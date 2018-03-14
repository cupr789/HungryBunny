package co.kr.hungrybunny.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.HallDAO;
import co.kr.hungrybunny.vo.HallVO;

@Repository
public class HallDAOImpl implements HallDAO{

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public Map<String, Object> selectResList(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<HallVO> resListWithTwo = ss.selectList("hall.selectResListWithTwo", shopNo);
		List<HallVO> resListWithFour = ss.selectList("hall.selectResListWithFour", shopNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resListWithTwo", resListWithTwo);
		map.put("resListWithFour", resListWithFour);
		ss.close();
		return map;
	}

}
