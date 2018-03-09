package kr.co.rabbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rabbit.dao.ShopCaDAO;
import kr.co.rabbit.service.ShopCaService;
import kr.co.rabbit.vo.ShopCaVO;
import kr.co.rabbit.vo.ShopVO;

@Service
public class ShopCaServiceImpl implements ShopCaService{

	@Autowired
	private ShopCaDAO cadao;
	
	@Override
	public List<ShopCaVO> getCaList() {
		return cadao.selectCaList();
	}
}
