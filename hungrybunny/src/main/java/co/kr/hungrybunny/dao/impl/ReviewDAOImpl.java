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

	//2018-04-05 혜진 추가함
	@Override
	public int selectReviewRating(int shopNo) {
		SqlSession ss = ssf.openSession();
		int reviewRatingAvg = 0;
		System.out.println("shopNo는 계속 오니?"+ shopNo);
		String reviewRatingAvgStr = ss.selectOne("review.selectReviewRatingAvg", shopNo);
		System.out.println("나오는 값은 이거에요"+reviewRatingAvgStr);
		if(reviewRatingAvgStr==null) {
			reviewRatingAvg = 0;
		}else {
			reviewRatingAvg = Integer.parseInt(reviewRatingAvgStr.toString());
		}
		ss.close();
		return reviewRatingAvg;
	}
	
	@Override
	public int checkReview(int resNo) {
		SqlSession ss = ssf.openSession();
		String reviewNoStr = ss.selectOne("review.checkReview", resNo);
		if(reviewNoStr==null) {
			return 0;
		}
		ss.close();
		return 1;
	}
}
