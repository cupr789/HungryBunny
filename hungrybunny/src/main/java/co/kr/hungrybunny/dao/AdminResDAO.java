package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.AdminResVO;

public interface AdminResDAO {

	List<AdminResVO> selectAdminShop(int shopNo);
}
