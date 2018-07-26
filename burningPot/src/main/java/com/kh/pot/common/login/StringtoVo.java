package com.kh.pot.common.login;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.kh.pot.member.model.vo.Member;

public class StringtoVo {

	public Member naverToVo(String apiResult) {
		String[] list = apiResult.split("\"");

		Member m = new Member();
		m.setmId(list[13]);
		m.setmPicture(list[17]);
		m.setGender(list[25]);
		m.setEmail(list[29]);
		m.setmName(list[33]);
		m.setPassword("naverLogin");
		m.setmCategory("회원");
		
		int yyyy = 0;
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR);
		
		System.out.println("nowYear"+nowYear);
		
		yyyy = list[21].equals("10-19") ? nowYear-10 :
				list[21].equals("20-29") ? nowYear-20 : 
				list[21].equals("30-39") ? nowYear-30 : 
				list[21].equals("40-49") ? nowYear-40 :
				list[21].equals("50-59") ? nowYear-50 :
				list[21].equals("60-") ? nowYear-60 : nowYear-60;
			
		System.out.println("yyyy"+yyyy);
		String mYear = toString().valueOf(yyyy);
		java.sql.Date sqlDate = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date;
			date = sdf.parse(mYear+"-"+list[37]);
			sqlDate = new java.sql.Date(date.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		m.setBirthDate(sqlDate);
		
		System.out.println("맴버:"+m);
		return m;
	}

}
