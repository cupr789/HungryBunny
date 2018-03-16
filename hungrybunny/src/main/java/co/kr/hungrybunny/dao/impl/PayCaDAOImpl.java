package co.kr.hungrybunny.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.hungrybunny.dao.PayCaDAO;
import co.kr.hungrybunny.vo.PayCaVO;

@Repository
public class PayCaDAOImpl implements PayCaDAO {
	
	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public List<PayCaVO> selectPayCa() {
		SqlSession ss = ssf.openSession();
		List<PayCaVO> payCaList = ss.selectList("payCa.selectPayCa");
		ss.close();
		return payCaList;
	}

}
