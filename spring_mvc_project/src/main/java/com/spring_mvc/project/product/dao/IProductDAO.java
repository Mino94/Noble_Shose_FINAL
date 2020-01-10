package com.spring_mvc.project.product.dao;

import java.util.ArrayList;

import com.spring_mvc.project.product.model.ProductDTO;

public interface IProductDAO {

	public ArrayList<ProductDTO> productListCtg(String ctgId);
	
	public ArrayList<ProductDTO> productList();
	public void insertProduct(ProductDTO prd);
	public ProductDTO productDetailView(String prdNo);
	public void updateProduct(ProductDTO prd);
	public void deleteProduct(String prdNo);
}
