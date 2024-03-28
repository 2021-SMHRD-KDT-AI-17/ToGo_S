package kr.smhrd.entity;


import lombok.Data;
import lombok.Getter;


import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class Order {

   private int order_idx;         // 주문식별자
   private String mb_id;         // 회원아이디
   private String ordered_at;      // 주문일자
   private int order_total_amount;   // 주문 총 가격
   private String order_status;   // 주무 상태
   private String store_id;      // 업체 아이디
   private int pick_up_time;      // 픽업 시간
   
}