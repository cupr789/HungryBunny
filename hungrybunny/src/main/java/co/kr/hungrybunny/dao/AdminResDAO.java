package co.kr.hungrybunny.dao;

import java.util.List;
import java.util.Map;



public interface AdminResDAO {

	List<Object> selectAdminShop(int shopNo);
	List<Object> selectShophall(int shopNo);
}
