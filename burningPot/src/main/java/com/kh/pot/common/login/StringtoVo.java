package com.kh.pot.common.login;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.pot.member.model.vo.Member;

public class StringtoVo {

	public Member naverToVo(String apiResult) {
		
		JsonNode profile = null;
		JsonNode userInfo = null;
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			profile = mapper.readTree(apiResult);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		userInfo = profile.path("response");
		
		Member m = new Member();
		
		m.setmId(userInfo.path("id").asText());
		m.setmPicture(userInfo.path("profile_image").asText());
		m.setGender(userInfo.path("gender").asText());
		m.setEmail(userInfo.path("email").asText());
		m.setmName(userInfo.path("name").asText());
		m.setPassword("naverLogin");
		m.setmCategory("회원");
		
		int yyyy = 0;
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR);
		
		yyyy = userInfo.path("age").asText().equals("10-19") ? nowYear-10 :
			userInfo.path("age").asText().equals("20-29") ? nowYear-20 : 
			userInfo.path("age").asText().equals("30-39") ? nowYear-30 : 
			userInfo.path("age").asText().equals("40-49") ? nowYear-40 :
			userInfo.path("age").asText().equals("50-59") ? nowYear-50 :
			userInfo.path("age").asText().equals("60-") ? nowYear-60 : nowYear-60;

		String mYear = toString().valueOf(yyyy);
		java.sql.Date sqlDate = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date;
			date = sdf.parse(mYear+"-"+userInfo.path("birthday").asText());
			sqlDate = new java.sql.Date(date.getTime());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		m.setBirthDate(sqlDate);
		// JSON 형태 반환값 처리
		
		System.out.println("맴버:"+m);
		return m;
	}

}
