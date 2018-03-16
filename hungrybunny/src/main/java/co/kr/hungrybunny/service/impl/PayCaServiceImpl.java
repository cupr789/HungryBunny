package co.kr.hungrybunny.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.PayCaDAO;
import co.kr.hungrybunny.service.PayCaService;
import co.kr.hungrybunny.vo.PayCaVO;

@Service
public class PayCaServiceImpl implements PayCaService {

	@Autowired
	private PayCaDAO pdao;
	
	@Override
	public List<PayCaVO> getPayCa() {
		return pdao.selectPayCa();
	}

}
