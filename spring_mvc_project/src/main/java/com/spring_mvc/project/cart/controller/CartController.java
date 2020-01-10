package com.spring_mvc.project.cart.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_mvc.project.cart.model.CartDTO;
import com.spring_mvc.project.cart.model.OrderInfoDTO;
import com.spring_mvc.project.cart.model.OrderProductDTO;
import com.spring_mvc.project.cart.service.CartService;
import com.spring_mvc.project.member.model.MemberDTO;

@Controller
public class CartController {
	@Autowired
	CartService service;
	
	//장바구니 추가
	@RequestMapping(value="/product/insertCart")
	public String insertCart(CartDTO dto, HttpSession session) {
		String memId =(String) session.getAttribute("sid");
		dto.setMemId(memId);
		
		int count = service.checkPrdInCart(dto.getPrdNo(), memId);
		
		if(count == 0) {
			service.insertCart(dto);
		}else {
			service.updateCart(dto);
		}
		return "redirect:/product/cartList";
	}
	
	//장바구니 목록 보기
	@RequestMapping(value="/product/cartList")
	public String viewCartList(Model model, HttpSession session) {
		
		String memId = (String) session.getAttribute("sid"); 
		
		ArrayList<CartDTO> cartList = service.cartList(memId);
		model.addAttribute("cartList", cartList);

		return "jsp/product/CartListView";
	}
	
	//장바구니 삭제
	@ResponseBody
	@RequestMapping(value="/product/deleteCart")
	public int deleteCart(@RequestParam(value="chbox[]")ArrayList<String> chkArr) {
		String cartNo ="";
		int result = 0;
		
		if(chkArr != null) {
			for(String i:chkArr) {
				cartNo = i;
				service.deleteCart(cartNo);
			}
			result=1;
		}
		
		return result;
	}
	
	//주문서 작성
	@RequestMapping(value="/product/orderForm")
	public String viewOrderform(@RequestParam String[] memId,
								@RequestParam int[] cartNo,
								@RequestParam int[] cartQty,
								Model model) {
		
		//주문하기 누르면 변경된 주문수량을 적용하기 위해 먼저 update 수행
		for(int i=0;i<cartNo.length;i++) {
			CartDTO dto = new CartDTO();
			dto.setCartNo(cartNo[i]);
			dto.setCartQty(cartQty[i]);
			service.updateCart(dto);
		}
		
		//주문서에 정보 출력
		//주문자 정보 가져오기
		MemberDTO memDto = service.getMemberInfo(memId[0]);
		//전화번호 split
		String[] hp =(memDto.getMemHp()).split("-");
		//주문자 정보 출력하기 위해 model에 저장
		model.addAttribute("memDto", memDto);
		model.addAttribute("hp1", hp[0]);
		model.addAttribute("hp2", hp[1]);
		model.addAttribute("hp3", hp[2]);
		
		
		ArrayList<CartDTO> cartList = service.cartList(memId[0]);
		model.addAttribute("cartList", cartList);
		
		return "jsp/product/orderForm";
	}
	@RequestMapping(value="/product/orderComplete")
	public String orderInsert(OrderInfoDTO ordInfoDto,
			 				HttpSession session,
			 				Model model,
							@RequestParam String hp1,
							@RequestParam String hp2,
							@RequestParam String hp3) {
	String hp = hp1+"-"+hp2+"-"+hp3;
	ordInfoDto.setOrdRcvPhone(hp);
	
	long timeNum = System.currentTimeMillis();
	SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
	String strTime = dayTime.format(new Date(timeNum));
	
	String rNum = "";
	for(int i=1;i<=4;i++) {
		rNum +=(int)(Math.random()*10);
	}
	String ordNo = strTime + "-" + rNum;
	ordInfoDto.setOrdNo(ordNo);
	service.insertOrder(ordInfoDto);
	
		/*
		 * // 주문 목록 보기 String memId =(String) session.getAttribute("sid");
		 * ordInfoDto.setMemId(memId); ArrayList<OrderInfoDTO> orderList =
		 * service.orderList(ordInfoDto); model.addAttribute("orderList", orderList);
		 */
	
	return "redirect:/product/myOrderView";
	}
	
	@RequestMapping(value="/product/myOrderView")
	public String orderInfoView(Model model, OrderInfoDTO order, HttpSession session) {
		
		String memId =(String) session.getAttribute("sid");

		order.setMemId(memId);
		
		ArrayList<OrderInfoDTO> orderList = service.orderList(order);
		
		model.addAttribute("orderList", orderList);
		
		return "jsp/product/myOrderView";
	}
/*
	@RequestMapping(value="/product/myOrderView")
	public String getOrderList( HttpSession session, OrderInfoDTO order,Model model ) {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		System.out.println(order);
		
		String memId = member.getMemId();
		
		order.setMemId(memId);
		
		ArrayList<OrderInfoDTO> orderList = service.orderList(order);
		
		model.addAttribute("orderList", orderList);
		
		System.out.println(model);
		System.out.println(orderList);
		
		return "jsp/product/orderList";
	}
	*/
}
