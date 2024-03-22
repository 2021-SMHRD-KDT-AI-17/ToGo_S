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

@Data
@Getter
@Setter
@ToString
public class Stores {

	private String store_id;
	private String store_pw;
	private String store_name;
	private String store_bno;
	private String store_tel;
	private String joined_at;
	private String service_idx;
	private String store_leave;

}
