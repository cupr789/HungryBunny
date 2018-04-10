package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;


import co.kr.hungrybunny.vo.ReviewVO;

public interface ReviewDAO {

	public int insertReview(Map<String, Object> map);
	public List<ReviewVO> selectReviewList(Map<String, Object> map);
	public Integer selectReviewTotalCnt(Map<String, Object> map);
	public int adminComment(Map<String, Object> map);
	public int selectReviewRating(int shopNo);
}
