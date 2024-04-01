package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Order;

@Mapper
public interface AdminMapper {

	List<Order> orderList();

}
