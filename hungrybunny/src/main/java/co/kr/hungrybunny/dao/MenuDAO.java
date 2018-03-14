package co.kr.hungrybunny.dao;

import java.util.List;

import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ReservationMenuVO;

public interface MenuDAO {

	List<MenuVO> selectMenuList(int shopNo);
	public int insertMenu(MenuVO mv);
	List<ReservationMenuVO> checkReservation(int menuNo);
	public int deletetMenu(MenuVO mv);
}
