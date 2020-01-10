package com.spring_mvc.project.product.service;

import java.util.ArrayList;

import com.spring_mvc.project.product.model.ProductDTO;


public interface IProductService {
	
	ArrayList<ProductDTO> productListCtg(String ctgId);
	
	ArrayList<ProductDTO> productList();
	void insertProduct(ProductDTO prd);
	void updateProduct(ProductDTO prd);
	void deleteProduct(String prdNo);
	ProductDTO productDetailView(String prdNo);

}
