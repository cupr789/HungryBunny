package co.kr.hungrybunny.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {
	@Autowired
	private SqlSessionFactory ssf;
	private SqlSession ss;
	
	public List<Object> selectList(String sqlId,Object obj){
		ss = ssf.openSession();
		List<Object> list = ss.selectList(sqlId, obj);
		ss.close();
		return list;
	}
}
