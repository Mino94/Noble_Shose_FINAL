package com.spring_mvc.project.product.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring_mvc.project.product.model.ProductDTO;
import com.spring_mvc.project.product.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService service;//DI 설정
	
	@RequestMapping(value="/product/productListCtgView/{ctgId}")
	public String viewProductList(@PathVariable String ctgId, Model model) {
		ArrayList<ProductDTO> prdList = service.productListCtg(ctgId);
		model.addAttribute("prdList", prdList);
		return "jsp/product/productListCtgView";
	}
	//상품 상세 페이지
	@RequestMapping(value="/product/productDetailView/{prdNo}")
	public String detailViewProduct(@PathVariable String prdNo,Model model) {		
		ProductDTO prd = service.productDetailView(prdNo);
		model.addAttribute("prd",prd);
		
		return"jsp/product/productDetailView";
	}
	/*
	//상품 등록 화면으로 이동
	@RequestMapping(value="/product/productNewForm",method=RequestMethod.GET)
	public String viewProductFrom() {
		return "product/productNewForm";
	}
	
	//상품등록
	@RequestMapping(value="/product/insert",method=RequestMethod.POST)
	public String insertProduct(ProductDTO prd) {
		service.insertProduct(prd);
		return "redirect:./productListView";
	}
	
	
	
	@RequestMapping(value="/product/updateForm/{prdNo}")
	public String updateProductForm(@PathVariable String prdNo,Model model) {
		ProductDTO prd=service.productDetailView(prdNo);
		model.addAttribute("prd",prd);
		return"product/productUpdateForm";
	}
	
	@RequestMapping(value="/product/update")
	public String updateProduct(ProductDTO prd) {
		service.updateProduct(prd);
		return"redirect:./productListView";
	}
	
	@RequestMapping(value="/product/delete/{prdNo}")
	public String deleteProduct(@PathVariable String prdNo) {
		service.deleteProduct(prdNo);
		//return"product/productListView";
		return"redirect:/product/productListView";//OK
		//절대 경로 사용 가능
		//return"redirect:http://localhost:8080/jdbc/productListView";//OK
		//return"http://localhost:8080/jdbc/product/productListView";//안됨(views 아래 찾기 때문)
	}*/
}
