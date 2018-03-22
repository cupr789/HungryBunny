package co.kr.hungrybunny.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.ReviewDAO;
import co.kr.hungrybunny.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public int insertReview(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("review.insertReview", map);
		ss.close();
		return result;
	}

	@Override
	public List<ReviewVO> selectReviewList(int shopNo) {
		SqlSession ss = ssf.openSession();
		List<ReviewVO> reviewList = ss.selectList("review.selectReviewList", shopNo);
		ss.close();
		return reviewList;
	}
}
