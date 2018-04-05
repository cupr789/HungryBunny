package co.kr.hungrybunny.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.ResDAO;
import co.kr.hungrybunny.vo.ReservationVO;

@Repository
public class ResDAOImpl implements ResDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public int insertRes(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		int resMenuCnt=0;
		int menuPrice=0;
		int payPrice=0;
		System.out.println("저 다온데여...."+map);
		ArrayList<String> resMenuCntList =  (ArrayList<String>) map.get("menuCntArr");
		ArrayList<String> menuPriceList =  (ArrayList<String>) map.get("menuPriceArr");
		System.out.println(resMenuCntList +"      ??");
		System.out.println(menuPriceList +"      ??");
		for(int i=0;i<resMenuCntList.size();i++) {
			if(menuPriceList.get(i)!=null) {
				resMenuCnt = Integer.parseInt(resMenuCntList.get(i));
				menuPrice = Integer.parseInt(menuPriceList.get(i));
				payPrice += (resMenuCnt*menuPrice);
			}
		}
		map.put("payPrice", payPrice);
		System.out.println(map+"   다오임플");
		int result = ss.insert("res.insertRes", map);
		if(result==1) {
			System.out.println("ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ흐엉 성공했셔");
		}
		if(result==0) {
			map.put("error", "엥? 뭐잘못한거아냐?");
		}
		ss.close();
		return result;
	}
	
	@Override
	public int insertResMenu(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		//Map<String, Object> resMap = new HashMap<String, Object>();
		int result=0;
		ArrayList<String> resMenuCntList =  (ArrayList<String>) map.get("menuCntArr");
		ArrayList<String> menuNoList =  (ArrayList<String>) map.get("menuNoArr");
		System.out.println("resMenuCntList : "+resMenuCntList + "menuNoList : "+menuNoList);
		for(int i=0;i<menuNoList.size();i++) {
			if(Integer.parseInt(resMenuCntList.get(i))!=0) {
				map.put("resMenuCnt", resMenuCntList.get(i));
				map.put("menuNo", menuNoList.get(i));
				result = ss.insert("res.insertResMenu", map);
				if(result==0) {
					map.put("error", "뭔가 하나가 안들어갔어");
				}
			}
		}
		ss.close();
		return result;
	}
	
	@Override
	public List<ReservationVO> selectConfirmRes(int uiNo){
		SqlSession ss = ssf.openSession();
		List<ReservationVO> confirmResList = ss.selectList("res.confirmRes", uiNo);
		System.out.println("confirmResList???"+confirmResList);
		ss.close();
		return confirmResList;
	}
	
	@Override
	public int deleteResMenu(Map<String,Object> map) {
		SqlSession ss = ssf.openSession();
		int result = ss.delete("res.deleteResMenu", map);
		ss.close();
		System.out.println("resMenu는 1나옴?"+result);
		return result;
	}
	
	@Override
	public int deleteRes(Map<String,Object> map) {
		SqlSession ss = ssf.openSession();
		int result = ss.delete("res.deleteRes", map);
		ss.close();
		System.out.println("res는 1나옴?"+result);
		return result;
	}
	
	@Override
	public int updateResStatus(Map<String,Object> map) {
		SqlSession ss = ssf.openSession();
		int result = ss.update("res.updateResStatus", map);
		ss.close();
		System.out.println("res는 1나옴?"+result);
		return result;
	}
}
