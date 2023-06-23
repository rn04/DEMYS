package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Product_AttachRepository;
import com.ducks.demys.boot.vo.Product_Attach;

@Service
public class Product_AttachService {
	
	private Product_AttachRepository product_AttachRepository;
	
	public Product_AttachService(Product_AttachRepository product_AttachRepository) {
		this.product_AttachRepository= product_AttachRepository;
	}
	
	public List<Product_Attach> getProduct_AttachListByPRODUCT_NUM(int PRODUCT_NUM){
		return product_AttachRepository.getProduct_AttachListByPRODUCT_NUM(PRODUCT_NUM);
	}

	
	public Product_Attach getPbatByPDAT_NUM(int PDAT_NUM) {
		return product_AttachRepository.getPdatByPDAT_NUM(PDAT_NUM);
	}
	
	public void registProduct_Attach(Product_Attach pdat) {
		pdat.setPDAT_NUM(product_AttachRepository.selectProduct_AttachSequenceNextValue());
		product_AttachRepository.registProduct_Attach(pdat);
	}
	
	public void removeProduct_Attach(int PDAT_NUM) {
		product_AttachRepository.removeProduct_Attach(PDAT_NUM);
	}
	
	public void removeMb_AttachAll(int PRODUCT_NUM) {
		product_AttachRepository.removeProduct_AttachAll(PRODUCT_NUM);
	}
}
