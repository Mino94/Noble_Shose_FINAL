package com.spring_mvc.project.cart.service;

import java.util.ArrayList;

import com.spring_mvc.project.cart.model.CartDTO;
import com.spring_mvc.project.cart.model.OrderInfoDTO;
import com.spring_mvc.project.cart.model.OrderProductDTO;
import com.spring_mvc.project.member.model.MemberDTO;

public interface ICartService {
	 void insertCart(CartDTO dto); //장바구니 추가
	 int checkPrdInCart(String prdNo, String memId); //동일 상품 확인
	 void updateQtyInCart(CartDTO dto); //동일 상품 존재하면 수량 변경
	 ArrayList<CartDTO> cartList(String memId); // 장바구니 목록
	
	 //주문 처리작업
	 void updateCart(CartDTO dto); //장바구니 수정
	 void deleteCart(String cartNo); //장바구니 전체 삭제
	 MemberDTO getMemberInfo(String memId);

	 //주문 내역 저장
	 void insertOrder(OrderInfoDTO ordInfoDto);
	 
	 ArrayList<OrderInfoDTO> orderList(OrderInfoDTO order);
}
