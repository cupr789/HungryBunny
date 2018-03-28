package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.AdminReview;
import co.kr.hungrybunny.vo.ReviewVO;

public interface ReviewDAO {

	public int insertReview(Map<String, Object> map);
	public List<ReviewVO> selectReviewList(int shopNo);
	public int adminComment(Map<String, Object> map);

}
