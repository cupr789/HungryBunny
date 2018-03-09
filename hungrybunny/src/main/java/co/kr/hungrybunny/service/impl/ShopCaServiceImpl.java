package co.kr.hungrybunny.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.ShopCaDAO;
import co.kr.hungrybunny.service.ShopCaService;
import co.kr.hungrybunny.vo.ShopCaVO;
import co.kr.hungrybunny.vo.ShopVO;

@Service
public class ShopCaServiceImpl implements ShopCaService{

	@Autowired
	private ShopCaDAO cadao;
	
	@Override
	public List<ShopCaVO> getCaList() {
		return cadao.selectCaList();
	}
}
