package com.spring_mvc.project.product.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_mvc.project.product.dao.IProductDAO;
import com.spring_mvc.project.product.model.ProductDTO;


@Service
public class ProductService implements IProductService {
	
	/*
	 * @Autowired ProductDAO dao;
	 */
	//MyBatis
	@Autowired
	@Qualifier("IProductDAO")
	IProductDAO dao;
	
	@Override
	public ArrayList<ProductDTO> productListCtg(String ctgId) {
		return dao.productListCtg(ctgId);
	}
	
	@Override
	public ArrayList<ProductDTO> productList() {
		return null;
	}

	
	@Override
	public ProductDTO productDetailView(String prdNo) {
		return dao.productDetailView(prdNo);
	}
	
	public void insertProduct(ProductDTO prd) {
		dao.insertProduct(prd);

	}

	public void updateProduct(ProductDTO prd) {
		// TODO Auto-generated method stub
		dao.updateProduct(prd);
	}

	@Override
	public void deleteProduct(String prdNo) {
		// TODO Auto-generated method stub
		dao.deleteProduct(prdNo);
	}



	
	
	
}
