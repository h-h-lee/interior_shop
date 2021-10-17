package kr.spring.orderDetail.service;

import java.util.List;

import kr.spring.orderDetail.vo.OrderDetailVO;

public interface OrderDetailService {
	 public void insertOrderDetail(OrderDetailVO orderDetailVO);
	 public List<OrderDetailVO> selectOrderDetail(String order_no);
}
