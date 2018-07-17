package com.kh.pot.member.model.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.pot.common.emailHandler.MailHandler;
import com.kh.pot.common.emailHandler.TempKey;
import com.kh.pot.member.model.dao.MemberDao;
import com.kh.pot.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public List<Member> selectMemberList(int cPage, int limit, String customSelect, String keyword) {
				
		if(customSelect.equals("gender")){
			if(keyword.equals("여자") || keyword.equals("여") || keyword.equals("녀") || keyword.equals("여성")
			|| keyword.toLowerCase().equals("femail") || keyword.toLowerCase().equals("f") 
			|| keyword.toLowerCase().equals("woman")){
				keyword = "F";
			}else if(keyword.equals("남자") || keyword.equals("남") || keyword.equals("남성")
			|| keyword.toLowerCase().equals("mail") || keyword.toLowerCase().equals("m") 
			|| keyword.toLowerCase().equals("man")){
				keyword = "M";
			}
		}
		
		return memberDao.selectMemberList(cPage, limit, customSelect, keyword);
	}

	@Override
	public Member selectOneMember(String mNum) {
		
		return memberDao.selectOneMember(mNum);
	}

	
	@Override
	public int selectCountMember(int cPage, int limit, String customSelect, String keyword) {
		
		if(customSelect.equals("gender")){
			if(keyword.equals("여자") || keyword.equals("여") || keyword.equals("녀") || keyword.equals("여성")
			|| keyword.toLowerCase().equals("femail") || keyword.toLowerCase().equals("f") 
			|| keyword.toLowerCase().equals("woman")){
				keyword = "F";
			}else if(keyword.equals("남자") || keyword.equals("남") || keyword.equals("남성")
			|| keyword.toLowerCase().equals("mail") || keyword.toLowerCase().equals("m") 
			|| keyword.toLowerCase().equals("man")){
				keyword = "M";
			}
		}
		
		return memberDao.selectCountMember(cPage, limit, customSelect, keyword);
	}

	/* 예찬 부분 */
	
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int checkIdDuplicate(String mId) {
		return memberDao.checkIdDuplicate(mId);
	}

	@Override
	public int checkEmailDuplicate(String email) {
		return memberDao.checkEmailDuplicate(email);
	}

	@Override
	public Member selectMemberId(String userId) {
		return memberDao.selectMemberId(userId);
	}

	@Override
	public int checkNameDuplate(String mName) {
		return memberDao.checkNameDuplicate(mName);
	}
	
	@Inject
    private JavaMailSender mailSender;


    @Override
    public void regist(String email) throws Exception {

        String key = new TempKey().getKey(50,false);  // 인증키 생성
        
        HashMap<String, String> map = new HashMap<String, String>();
        System.out.println("key 생성 : "+key);
        
        map.put("email", email);
        map.put("key", key);
        
        int insertResult = memberDao.createAuthKey(map); //인증키 db 저장
        
        System.out.println("insertResult"+insertResult);
        
	    if(insertResult > 0){
	    	//메일 전송
	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[인증] BurningPot 이메일 인증");
	        sendMail.setText(
	                new StringBuffer().append("링크를 눌러 메일인증을 진행해주세요! <br><br>").append("<a href='http://localhost:8088/pot/member/emailConfirm.do?userEmail=")
	                .append(email)
	                .append("&memberAuthKey=").append(key)
	                .append("' target='_blank'>이메일 인증 확인</a>").toString());
	        sendMail.setFrom("burningpotdo@gmail.com", "BurningPot ");
	
	
	        sendMail.setTo(email);
	        sendMail.send();
	    }else{
	    	System.out.println("인증키 저장 오류");
	    }
        
    }

    //이메일 인증 키 검증
    @Override
    public int userAuth(String email, String key){
       
    	HashMap<String, String> map = new HashMap<String, String>(); 
    	
        map.put("email", email);
        map.put("key", key);
    	
        int result = memberDao.chkAuth(map);
        System.out.println("userAuthresult:"+result);
        if(result > 0){
            try{
                System.out.println("서비스 userAuth:"+email);
                memberDao.userAuth(email);
        }catch (Exception e) {
            e.printStackTrace();
        }}
    
    return result;
    }

	@Override
	public int deleteMail(String emailAddr) {
		return memberDao.deleteMail(emailAddr);
	}

	@Override
	public String checkEmailConfirm(String emailAddr) {
		return memberDao.checkEmailConfirm(emailAddr);
	}

	/* 예찬 부분  끝*/

}
