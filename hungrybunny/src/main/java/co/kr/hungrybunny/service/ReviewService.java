package co.kr.hungrybunny.service;

import java.util.List;
import java.util.Map;

import co.kr.hungrybunny.vo.ReviewVO;

public interface ReviewService {

	public int insertReview(Map<String, Object> map);
	public List<ReviewVO> getReviewList(int shopNo);
}
