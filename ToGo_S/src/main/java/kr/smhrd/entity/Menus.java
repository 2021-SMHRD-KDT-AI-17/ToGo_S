package kr.smhrd.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class Menus {

	private int menu_idx;		// 메뉴 식별자
	private String store_id;	// 업체 아이디
	private String menu_name;	// 메뉴명
	private int menu_price;		// 메뉴 가격
	private String menu_desc;	// 메뉴 설명
	private String menu_img;	// 메뉴 이미지
	private String menu_soldout;// 메뉴 매진 여부
	
}
