package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Order;
import kr.smhrd.entity.Order_details;

@Mapper
public interface AdminMapper {

	List<Order> orderList();

	List<Order_details> detailList();

	Order_details orderDetailSelect(int order_idx);

}
