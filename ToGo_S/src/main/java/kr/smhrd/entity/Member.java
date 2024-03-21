package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// @Data - 만능

@AllArgsConstructor
@NoArgsConstructor // 기본생성자
@RequiredArgsConstructor
@Getter
@Setter
@ToString
public class Member {

	@NonNull
	private String email;
	@NonNull
	private String pw;
	private String tel;
	private String address;
	
	
	
	
}
