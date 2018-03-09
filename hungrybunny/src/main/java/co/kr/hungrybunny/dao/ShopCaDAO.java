package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.ShopCaVO;
import co.kr.hungrybunny.vo.ShopVO;

public interface ShopCaDAO {

	List<ShopCaVO> selectCaList();
}
