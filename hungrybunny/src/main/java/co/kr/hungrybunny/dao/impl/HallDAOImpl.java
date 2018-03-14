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
	public List<HallVO> selectHallList(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<HallVO> resList = ss.selectList("hall.selectResList", shopNo);
		System.out.println("???????????????????????????????"+resList);
		ss.close();
		return resList;
	}

}
