package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Product_Attach;

@Mapper
public interface Product_AttachRepository {
	
	public List<Product_Attach> getProduct_AttachListByPRODUCT_NUM(int PRODUCT_NUM);
	
	public Product_Attach getPdatByPDAT_NUM(int PDAT_NUM);
	
	public int selectProduct_AttachSequenceNextValue();
	
	public void registProduct_Attach(Product_Attach pdat);
		
	public void removeProduct_Attach(int PDAT_NUM);

	public void removeProduct_AttachAll(int PRODUCT_NUM);
}