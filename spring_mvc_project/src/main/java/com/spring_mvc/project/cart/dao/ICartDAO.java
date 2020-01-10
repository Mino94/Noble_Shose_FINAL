package com.spring_mvc.project.cart.dao;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;

import com.spring_mvc.project.cart.model.CartDTO;
import com.spring_mvc.project.cart.model.OrderInfoDTO;
import com.spring_mvc.project.cart.model.OrderProductDTO;
import com.spring_mvc.project.member.model.MemberDTO;

public interface ICartDAO {
	public void insertCart(CartDTO dto);
	public int checkPrdInCart(HashMap<String, Object> map);
	public void updateQtyInCart(CartDTO dto);
	public ArrayList<CartDTO> cartList(String memId);
	
	//주문 처리 작업
	public void updateCart(CartDTO dto);
	//주문서 작성
	public void deleteCart(String cartNo);
	public MemberDTO getMemberInfo(String memId); //회원 정보 알아보기
	
	//주문 내역 저장
	public void insertOrderInfo(OrderInfoDTO ordInfoDto);
	public void insertOrderProduct(HashMap<String, Object> map);
	public void deletCartAfterOrder(String memId);

	public ArrayList<OrderInfoDTO> orderList(OrderInfoDTO order);
	
}
