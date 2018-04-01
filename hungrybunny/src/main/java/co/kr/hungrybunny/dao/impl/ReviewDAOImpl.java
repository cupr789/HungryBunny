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
	public List<ReviewVO> selectReviewList(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		List<ReviewVO> reviewList = ss.selectList("review.selectReviewList", map);
		ss.close();
		return reviewList;
	}

	@Override
	public Integer selectReviewTotalCnt(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		System.out.println("map         : "+map);
		int reviewTotalCnt = ss.selectOne("review.selectReivewTotalCnt", map);
		ss.close();
		return reviewTotalCnt;
	}

	@Override
	public int adminComment(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int result =ss.update("review.adminComment", map);
		System.out.println("저장성공");
		ss.close();
		return result;
	}
}
