package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class Order_details {

	private int od_idx;			//주문 상세 식별자
	private int menu_idx;		// 메뉴식별자
	private int order_cnt;		// 주무 수량
	private String order_request;	// 요청사항
	private int order_idx;		// 주문식별자
	private String menu_good; 	// 메뉴추천
}
