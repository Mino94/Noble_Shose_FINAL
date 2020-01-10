package com.spring_mvc.project.cart.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_mvc.project.cart.dao.ICartDAO;
import com.spring_mvc.project.cart.model.CartDTO;
import com.spring_mvc.project.cart.model.OrderInfoDTO;
import com.spring_mvc.project.cart.model.OrderProductDTO;
import com.spring_mvc.project.member.model.MemberDTO;

@Service
public class CartService implements ICartService {

	@Autowired
	@Qualifier("ICartDAO")
	ICartDAO dao;
	
	@Override
	public void insertCart(CartDTO dto) {
		dao.insertCart(dto);
	}
	
	@Override
	public int checkPrdInCart(String prdNo, String memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prdNo", prdNo);
		map.put("memId", memId);
		return dao.checkPrdInCart(map);
	}

	@Override
	public void updateQtyInCart(CartDTO dto) {
		dao.updateQtyInCart(dto);
	}

	@Override
	public ArrayList<CartDTO> cartList(String memId) {
		return dao.cartList(memId);
	}

	@Override
	public void updateCart(CartDTO dto) {
		dao.updateCart(dto);
	}

	@Override
	public void deleteCart(String cartNo) {
		dao.deleteCart(cartNo);
	}
	
	
	 @Override public MemberDTO getMemberInfo(String memId) { 
		 return dao.getMemberInfo(memId); 
	 }

	@Override
	public void insertOrder(OrderInfoDTO ordInfoDto) {
		//1.주문 정보 저장(order_info 테이블)
		dao.insertOrderInfo(ordInfoDto);
		//2.주문 상품 내용 저장(order_product 테이블)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ordNo", ordInfoDto.getOrdNo());
		map.put("memId", ordInfoDto.getMemId());
		//주문 상품 저장
		dao.insertOrderProduct(map);
		//3.주문 완료 후 장바구니 삭제
		dao.deletCartAfterOrder(ordInfoDto.getMemId());
	}

	@Override
	public ArrayList<OrderInfoDTO> orderList(OrderInfoDTO order) {
		return dao.orderList(order);
	}
	
	


}
