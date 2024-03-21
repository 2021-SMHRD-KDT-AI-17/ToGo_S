package kr.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;

// 비동기 방식만 가능
// 데이터나, 객체 리턴
// 페이지 이동 불가능
@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private MemberMapper memberMapper;
	
	
	// Email 중복체크 /emailCheck
	@RequestMapping("/emailCheck")
	public int emailCheck(@RequestParam("inputE") String inputE) {
		Member member = memberMapper.emailCheck(inputE);
		//System.out.println(member.toString());
		if(member == null) {
			// 사용가능
			return 1;
		}else {
			// 사용불가능
			return 0;
		}
		
	}
	
	@RequestMapping("getMemberEmail")
	public String getMemberEmail() {
		List<Member> mylist = memberMapper.goShowMember();
		
		// Spring 프로젝트에서는 객체 배열을  return 할때 자동으로 json 형태로 바꿔준다.
		
//		JsonArray jarray = new JsonArray();
//		
//		for(int i =0; i<mylist.size();i++) {
//			JsonObject json = new JsonObject();
//			json.addProperty("email", mylist.get(i).getEmail());
//			json.addProperty("address", mylist.get(i).getAddress());
//			
//			jarray.add(json);
//		}
//		
//		return jarray.toString();
		Gson gson = new Gson();
		return gson.toJson(mylist).toString();
		
	}

	
	
	
}
