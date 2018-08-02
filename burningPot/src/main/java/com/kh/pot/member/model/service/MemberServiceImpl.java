package com.kh.pot.member.model.service;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.pot.common.emailHandler.MailHandler;
import com.kh.pot.common.emailHandler.TempKey;
import com.kh.pot.member.model.dao.MemberDao;
import com.kh.pot.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

   @Autowired
   MemberDao memberDao;
   
   @Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
   
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
      if(member.getmPicture()==null){
         member.setmPicture("defaultPerson.png");
      }
      
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
        
        map.put("email", email);
        map.put("key", key);
        
        int insertResult = memberDao.createAuthKey(map); //인증키 db 저장
        String serverIp = FindMyIP();
       if(insertResult > 0){
          //메일 전송
           MailHandler sendMail = new MailHandler(mailSender);
           sendMail.setSubject("[인증] BurningPot 이메일 인증");
           sendMail.setText(
                   new StringBuffer().append("링크를 눌러 메일인증을 진행해주세요! <br><br>").append("<a href='http://"+serverIp+":8088/pot/member/emailConfirm.do?userEmail=")
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
    
    // Server IP 구함
    public String FindMyIP() { 
       InetAddress ip =null;
       try { 
          ip = InetAddress.getLocalHost(); 
       } catch (Exception e) { 
          System.out.println(e);
       }
       return ip.getHostAddress();
   }


    //이메일 인증 키 검증
    @Override
    public int userAuth(String email, String key){
       
       HashMap<String, String> map = new HashMap<String, String>(); 
       
        map.put("email", email);
        map.put("key", key);
       
        int result = memberDao.chkAuth(map);

        if(result > 0){
            try{
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

   @Override
   public String findMemberId(String mEmail, String mBirth) {
       
      HashMap<String, String> map = new HashMap<String, String>();
        map.put("email", mEmail);
        map.put("birth", mBirth);
       
      return memberDao.findMemberId(map);
   }

   @Override
   public void findMember(String mEmail, String memberId, boolean isId) throws Exception {
      
      if(isId){
          // 아이디 찾기 메일 전송
           MailHandler sendMail = new MailHandler(mailSender);
           sendMail.setSubject("BurningPot 아이디 찾기");
           sendMail.setText(
                   new StringBuffer().append("회원님의 아이디는 <br><h2>")
                   .append(memberId)
                   .append("</h2>입니다.").toString());
           sendMail.setFrom("burningpotdo@gmail.com", "BurningPot ");
           sendMail.setTo(mEmail);
           sendMail.send();
      }else{
         // 비밀번호 찾기 메일 전송
         String tmpPwd = new TempKey().getKey(6,false);  // 임시비밀번호 생성
         Map<String, String> map = new HashMap<String, String>();
         map.put("id", memberId);
         
         /******* password 암호화 로직 시작 *******/
 		// 암호화 주석
        /*String bcryptPw = bcryptPasswordEncoder.encode(tmpPwd);
 		map.put("tmpKey", bcryptPw);*/
         
        map.put("tmpKey", tmpPwd);
         
        int updateR = memberDao.updatePwd(map);
         
        if(updateR > 0){
         
            MailHandler sendMail = new MailHandler(mailSender);
              sendMail.setSubject("[BurningPot] 임시비밀번호 발급");
              sendMail.setText(
                      new StringBuffer().append(memberId).append("님의 임시비밀번호는 <br><br><h2>")
                      .append(tmpPwd)
                      .append("</h2><br>입니다.")
                      .append("<br>임시비밀번호로 로그인 후 변경해주세요!").toString());
              sendMail.setFrom("burningpotdo@gmail.com", "BurningPot ");
              sendMail.setTo(mEmail);
              sendMail.send();
         }else System.out.println("임시 비밀번호 변경 실패!");
      }
         
   }

   @Override
   public Member findMemberPwd(String pMId, String pEmail, String pBirth) {
      HashMap<String, String> map = new HashMap<String, String>();
        map.put("id", pMId);
        map.put("email", pEmail);
        map.put("birth", pBirth);
        
      return memberDao.findMemberPwd(map);
   }

   /* 예찬 부분  끝*/

}