package co.kr.hungrybunny.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.ResDAO;
import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ReservationMenuVO;
import co.kr.hungrybunny.vo.ReservationVO;

@Repository
public class ResDAOImpl implements ResDAO {

	@Autowired
	SqlSessionFactory ssf;
	
	@Override
	public int insertRes(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		System.out.println("저 다온데여...."+map);
		
		int result = ss.insert("res.insertRes", map);
		if(result==1) {
			System.out.println("ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ흐엉 성공했셔");
		}
		ss.close();
		return result;
	}
	
	@Override
	public int insertResMenu(Map<String, Object> map) {
		SqlSession ss = ssf.openSession();
		//Map<String, Object> resMap = new HashMap<String, Object>();
		int result=0;
		String[] resMenuCntList = (String[]) map.get("resMenuCntList");
		String[] menuNoList = (String[]) map.get("menuNoList");
		System.out.println("resMenuCntList : "+resMenuCntList + "menuNoList : "+menuNoList);
		for(int i=0;i<menuNoList.length;i++) {
			
			if(Integer.parseInt(resMenuCntList[i])!=0) {
				//resMap = new HashMap<String, Object>();
				map.put("resMenuCnt", resMenuCntList[i]);
				map.put("menuNo", menuNoList[i]);
				result = ss.insert("res.insertResMenu", map);
				if(result==0) {
					map.put("error", "뭔가 하나가 안들어갔어");
				}
			}
		}
		ss.close();
		return 0;
	}

}
