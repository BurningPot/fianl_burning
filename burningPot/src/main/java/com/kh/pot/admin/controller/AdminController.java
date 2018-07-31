package com.kh.pot.admin.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.admin.model.service.AdminService;
import com.kh.pot.admin.model.vo.PageInfo;
import com.kh.pot.admin.model.vo.Statistics;
import com.kh.pot.board.model.service.BoardService;
import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;
import com.kh.pot.board.model.vo.Report;
import com.kh.pot.common.exception.PotException;
import com.kh.pot.ingredient.model.service.IngredientService;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.member.model.service.MemberService;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.recipe.model.vo.Recipe;

@Controller
public class AdminController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	IngredientService ingService;
	
	@Autowired
	AdminService adminService;	
	
	// 관리자 홈
	@RequestMapping("/admin/goAdmin.do")
	public String goAdminMenu(Model model) throws PotException{
		model.addAttribute("commonTitle","관리자 페이지");
		//1. 연령별 회원분포 정보
		try{
		ArrayList<Integer> ageList = (ArrayList<Integer>) adminService.selectAgeCount();
		
		//2. 성별 회원분포 정보
		ArrayList<Integer> genderList = (ArrayList<Integer>)adminService.selectGenderCount();
		
		//3. 가장 인기 있는 레시피
		ArrayList<Statistics> popularRecipe = (ArrayList<Statistics>)adminService.selectPopularRecipeRanking();
		
		//4. 레시피 가장 많이 쓴 사람
		ArrayList<Statistics> topWriter =(ArrayList<Statistics>)adminService.selectTopWriter();
		
		//5. 남성 선호 레시피
		ArrayList<Statistics> maleFavor = (ArrayList<Statistics>)adminService.selectMaleFavor();
		
		//6. 여성 선호 레시피
		ArrayList<Statistics> femaleFavor = (ArrayList<Statistics>)adminService.selectFemaleFavor();
		
		//7. 연령별 선호 레시피는 차후에 데이터가 충분해지면 만들자
		
		
		model.addAttribute("age",ageList)
		.addAttribute("popularRecipe", popularRecipe)
		.addAttribute("topWriter", topWriter)
		.addAttribute("gender", genderList)
		.addAttribute("maleFavor", maleFavor)
		.addAttribute("femaleFavor", femaleFavor);
		}catch(Exception e){
			throw new PotException("관리자페이지 에러!", "통계자료를 가져오는 도중 에러가 발생했습니다");
		}
		return "admin/adminHome";
	}
	
	// 회원검색메뉴
	@RequestMapping("/admin/goSearchMember.do")
	public String goSearchmember(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="customSelect", required=false, defaultValue="null") String customSelect,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
			Model model) throws PotException{		
		
		//--페이지 처리 코드 부분
		int startPage; 	// 한번에 표시될 게시글들의 시작 페이지
		int endPage;	// 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;	// 전체 페이지의 마지막 페이지
		int currentPage; // 현재 페이지
		int limit;  	//한 페이지당 게시글 수
		
		//게시판은 1 페이지부터 시작한다
		currentPage = 1;
		
		//한 페이지에 보여질 게시글 수
		limit = 5;
		
		//만약에 전달받는 페이지가 있을 경우  즉, 현재페이지 정보를 받을 경우
		//currentPage의 값을 수정한다
		if(cPage != 1){
			currentPage = cPage;
		}
			
		try{
		//전체 게시글의 수
		int listCount = memberService.selectCountMember(currentPage, limit, customSelect, keyword); 
		
		System.out.println("총 게시글의 수 : "+listCount);
		
		//총 게시글 수에 대한 페이지 계산
		//ex) 목록의 수가 123개 라면 페이지수는 13페이지!
		// 짜투리 게시글도 하나의 페이지로 취급해야 한다
		// 10 / 1 --> 0.9를 더하여 하나의 페이지로 만든다
				
		maxPage = (int)((double)listCount / limit +0.9);
				
		//현재 화면에 표시할 페이지 갯수
		//첫 페이지의 번호
		//ex) 한 화면에 10개의 페이지를 표시하는 경우
		startPage = ( ( (int)(  (double)currentPage / limit +0.9) ) -1 ) * limit + 1;
		
		//한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + limit - 1;
				
		if(maxPage < endPage){
			endPage = maxPage;
		}
		//페이지 관련 변수 전달용 VO 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, startPage, endPage, maxPage);
		//--페이지 처리 코드 부분	
				
		model.addAttribute("commonTitle","회원조회");
		
		ArrayList<Member> list = (ArrayList<Member>) memberService.selectMemberList(currentPage, limit, customSelect, keyword);
		
		
		model.addAttribute("list",list)
		.addAttribute("customSelect", customSelect)
		.addAttribute("keyword", keyword)
		.addAttribute("startPage", startPage)
		.addAttribute("endPage", endPage)
		.addAttribute("maxPage", maxPage)
		.addAttribute("cPage", currentPage)
		.addAttribute("limit", limit);
		
		}catch(Exception e){
			throw new PotException("회원정보페이지 에러!", "회원정보를 가져오는 도중 에러가 발생했습니다!");
		}
		
		//페이지 처리가 필요하다	
		return "admin/adminMemberSearch";
	}
	
	// 회원 조회 Ajax
	@ResponseBody
	@RequestMapping("/admin/memberDetail.do")
	public HashMap<String, Object> memberDetail(@RequestParam String mNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Member m = memberService.selectOneMember(mNum);		
		
		String str = m.getBirthDate().toString();
		String[] strArr = str.split("-");
			
		String bDate = strArr[0]+"년 "+strArr[1]+"월 "+strArr[2]+"일";	
		
		map.put("name", m.getmName());
		map.put("id", m.getmId());
		map.put("email", m.getEmail());
		map.put("gender", m.getGender());
		map.put("birthDate", bDate);
		map.put("picture", m.getmPicture());
		
		return map;
	}
	
	/*// 신고게시판
	@RequestMapping("/admin/goReport.do")
	public String goReport(Model model){
		model.addAttribute("commonTitle","신고게시판");
		return "admin/adminReport"; 
	}*/
	
	// Q&A게시판
	@RequestMapping("/admin/goQNA.do")
	public String goQandA(Model model, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage) throws PotException{
		model.addAttribute("commonTitle","Q&A 게시판");
		
		String bCategory = "QNA";
		int numPerPage = 10; // 한 페이지 당 게시글 수
		try{
		ArrayList<Board> list = (ArrayList<Board>) boardService.selectBoard(cPage, numPerPage, bCategory);
		
		int totalContents = boardService.selectCount(bCategory);
		
		System.out.println("list : "+list);	
		
		model.addAttribute("list",list)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("totalContents", totalContents)
		.addAttribute("detailMapping","detailQNA.do")
		.addAttribute("servletMapping", "goQNA.do");
		}catch(Exception e){
			throw new PotException("Q&A게시판 오류!", "Q&A게시판을 불러오는 도중 에러가 발생했습니다");
		}
		return "admin/adminBoard";
	}
	
		
	//게시판 내용보기!
	@RequestMapping("/admin/detailQNA.do")
	public String detailQandA(Model model, @RequestParam int bNum) throws PotException{
		String bCategory = "QNA";
		model.addAttribute("commonTitle","Q&A 게시판");
		try{
		Board b = boardService.selectBoardDetail(bCategory, bNum);
		
		model.addAttribute("b", b); // 특정 게시글의 내용을 불러온다
		
		ArrayList<BoardComment> bcList = (ArrayList<BoardComment>) boardService.selectBoardComment(bNum);
		
		model.addAttribute("bcList", bcList)
		.addAttribute("detailMapping","detailQNA.do")
		.addAttribute("servletMapping", "goQNA.do")
		.addAttribute("mId", "admin")		// 임시적으로 회원의 정보를 넘겨주기 (나중에 로그인합쳐지면 세션으로 받기)
		.addAttribute("mNum", 1);			// 임시적으로 회원의 정보를 넘겨주기
		}catch(Exception e){
			throw new PotException("Q&A게시판 오류!","Q&A 게시글을 불러오는 도중 에러가 발생했습니다");
		}
		return "admin/adminBoard_Detail";
	}
	
	//게시글 삭제하기!
	@ResponseBody
	@RequestMapping("/admin/deleteBoard.do")
	public int deleteBoard(@RequestParam int bNum){
		int result = boardService.deleteBoard(bNum);		
		return result;
	}
	
	//게시글에 댓글달기(답변)
	@ResponseBody
	@RequestMapping("/admin/insertBoardComment.do")
	public HashMap<String, Object> insertBoardComment(@RequestParam String comment, 
			@RequestParam int bNum, @RequestParam int mNum, 
			Model model){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("comment", comment);
		map.put("bNum", bNum);
		map.put("mNum", mNum);			
		
		boardService.insertBoardComment(map);
		
		ArrayList<BoardComment> list = (ArrayList<BoardComment>) boardService.selectBoardComment(bNum);
		int lastBcNum = list.get(list.size()-1).getBcNum();
		map.put("bcNum", lastBcNum);		
		
		
		return map;
	}
	
	//게시글에 답변 달면 답변컬럼 Y로 바꾸기!
	@ResponseBody
	@RequestMapping("/admin/updateBoardReply.do")
	public int updateBoardReply(@RequestParam int bNum, @RequestParam boolean YorN){		
		
		int result = boardService.updateBoardReply(bNum, YorN);
		
		return result;
	}
	
	//게시글의 댓글 삭제하기
	@ResponseBody
	@RequestMapping("/admin/deleteBoardComment.do")
	public int deleteBoardComment(@RequestParam int bcNum){
		System.out.println("bcNum은 넘어왓나요? : "+bcNum);
		
		int result = boardService.deleteBoardComment(bcNum);
		
		return result;
	}
	
	// 재료요청 게시판
	@RequestMapping("/admin/goRequestIngredient.do")
	public String goRequestIngredient(Model model, 
			@RequestParam(value="cPage", required=false, defaultValue= "1" ) int cPage)throws PotException{
		
		String bCategory = "재료요청";
		int numPerPage = 10;
		try{
		ArrayList<Board> list = (ArrayList<Board>) boardService.selectBoard(cPage, numPerPage, bCategory);
		int totalContents = boardService.selectCount(bCategory);
		
		model.addAttribute("list", list)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("totalContents", totalContents)
		.addAttribute("detailMapping","ingRequestDetail.do")
		.addAttribute("servletMapping", "goRequestIngredient.do")		
		.addAttribute("commonTitle","재료요청 게시판");
		}catch(Exception e){
			throw new PotException("재료요청게시판 오류!","재료요청게시글을 불러오는 도중 에러가 발생했습니다");
		}
		return "admin/adminBoard";
	}
	
	// 재료요청 게시판 내용 보기
	@RequestMapping("/admin/ingRequestDetail.do")
	public String ingRequestDetail(@RequestParam int bNum, Model model)throws PotException{
		String bCategory = "재료요청";
		
		model.addAttribute("commonTitle","재료요청 게시판");
		
		try{
		// 특정 게시글의 정보 불러오기
		Board b = boardService.selectBoardDetail(bCategory, bNum);
		
		// 특정 게시글의 댓글들 불러오기
		ArrayList<BoardComment> bcList = (ArrayList<BoardComment>) boardService.selectBoardComment(bNum);
				
		model.addAttribute("bcList", bcList)
		.addAttribute("b",b)
		.addAttribute("detailMapping","ingRequestDetail.do")
		.addAttribute("servletMapping", "goRequestIngredient.do")
		.addAttribute("mId", "admin")		// 임시적으로 회원의 정보를 넘겨주기 (나중에 로그인합쳐지면 세션으로 받기)
		.addAttribute("mNum", 1);			// 임시적으로 회원의 정보를 넘겨주기
		}catch(Exception e){
			throw new PotException("재료요청게시판 오류!","재료요청글을 불러오는 도중 에러가 발생했습니다");
		}
		return "admin/adminIngRequest_Detail";
	}
	
	@ResponseBody
	@RequestMapping("admin/searchIngredientAjax.do")
	public ArrayList<Ingredient> searchIngredientAjax(@RequestParam String keyword){
		
		ArrayList<Ingredient> ingList = (ArrayList<Ingredient>) ingService.searchIngredientAjax(keyword);
				
		return ingList;
	}
		
	// 재료 관리 메뉴로 이동하기
	/***
	 * Move to Food Ingredient Page. 2018-07-13 [HYD]
	 ***/
	@RequestMapping("/admin/goIng.do")
	public String goIng(Model model)throws PotException{
		model.addAttribute("commonTitle","재료관리 페이지");
		
		try{
		ArrayList<Ingredient> distinctList = (ArrayList<Ingredient>)ingService.selectDistinctName();
		ArrayList<String> ingNameList = (ArrayList<String>)ingService.selectAllIngredientName();
		
		model.addAttribute("distinctList",distinctList).addAttribute("ingNameList", ingNameList);
		}catch(Exception e){
			throw new PotException("재료관리 페이지 오류!","재료구분을 불러오는 도중 에러가 발생했습니다!");
		}
		
		return "admin/adminIngredient";
	}
	
	//재료 큰분류를 클릭하면 세부 분류가 나오게 한다
	@ResponseBody
	@RequestMapping("/admin/selectBigCategory.do")
	public ArrayList<Ingredient> selectBigCategory(@RequestParam String bCategory){
						
		return (ArrayList<Ingredient>)ingService.selectBigCategory(bCategory);
	}
	
	//재료 세부분류를 선택하면 재료리스트가 나오게 한다
	@ResponseBody
	@RequestMapping("/admin/selectSubCategory.do")
	public ArrayList<Ingredient> selectSubCategory(@RequestParam String subCategory){
		
		return (ArrayList<Ingredient>)ingService.selectSubCategory(subCategory);
	}
	
	@ResponseBody
	@RequestMapping("/admin/showIngSearchResult.do")
	public ArrayList<Ingredient> showIngSearchResult(@RequestParam String iName){
		
		return (ArrayList<Ingredient>)ingService.showIngSearchResult(iName);
	}
	
	@ResponseBody
	@RequestMapping("admin/deleteIngredient.do")
	public int deleteIngredient(@RequestParam int iNumber){
		
		return ingService.deleteIngredient(iNumber);		
	}
	
	
	@RequestMapping("admin/updateIngInfo.do")
	public String updateIngInfo(HttpServletRequest request, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upfiles, 
			@RequestParam(value="iNum") int iNum, @RequestParam String img, 
			@RequestParam(value="exdate", required=false, defaultValue="0") int exdate, 
			@RequestParam String iName, @RequestParam String keyword,
			@RequestParam String cName, @RequestParam String subCName,
			Model model)throws PotException{
				
		System.out.println("들어오나요?");
		System.out.println("img원래것 이름은? :"+img);
		//이미지가 변경될 경우에는 이부분도 추가		
		//1. 파일 저장 경로 생성하기
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/img/ingredient");
				
		File dir = new File(saveDir);
				
		// 만약 현재 저장하려는 경로에 폴더가 없다면 만들겠습니다!
		if(!dir.exists()){
			System.out.println("dir.mkdirs() = "+dir.mkdirs());
		}
		
		String renameFileName = "";
		
		try{
		// file input에 무언가가 들어왔다면(수정하기를 눌러 사진을 넣어서 보냈다면) 실행시킬 부분이다
		if(upfiles.length >0){
			if(!upfiles[0].isEmpty()){
			String originFileName = upfiles[0].getOriginalFilename(); // 원본파일 이름
			String ext = originFileName.substring(originFileName.lastIndexOf(".")+1); //확장자
			
			//이름을 새로 만들어서 변경해준다
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");			
			int randomNum = (int)(Math.random() * 1000);			
			renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"_"+randomNum+"."+ext;
			
			//새로만든 이름으로 저장경로에 저장시킨다
			try {
				upfiles[0].transferTo(new File(saveDir+"/"+renameFileName));
			} catch (IllegalStateException | IOException e) {					
				e.printStackTrace();
			}	
			//사진 수정을 한 채로 재료의 정보를 수정한다
			int result1 = ingService.updateIngInfo(iNum, renameFileName, exdate, iName);
			System.out.println("재료정보 업데이트 : "+result1);	
			
			//사진을 수정한 후에는 기존의 이미지는 삭제한다
			File file = new File(saveDir+"/"+img);		
			System.out.println("기존의 이미지 이름 : "+img);
			// 파일이 실제로 존재하는지 검사
			
			if( file.exists() ){
				System.out.println("파일 실존함");
				file.delete();
				System.out.println("기존의 "+img+"를 삭제하였다!");				 
			}	
			
			model.addAttribute("img", renameFileName);
		}else{
			// 사진 수정이 없는 채로 재료의 정보를 수정한다			
			int result1 = ingService.updateIngInfo(iNum, img, exdate, iName);			
			System.out.println("재료정보 업데이트 : "+result1);
			model.addAttribute("img", img);
		}	
	}
		}catch(Exception e){
			throw new PotException("재료관리 페이지 오류!","재료정보를 수정하는 도중 에러가 발생했습니다");
		}
		
		try{
		//기존에 있는 키워드는 제외하고 insert 시켜야 하므로 기존의 keyword들도 불러와야한다
		//1. 해당 iNum에  해당하는 keyword들을 모두 제거한다
		ingService.deleteIngKeyword(iNum);
		
		//2. 넘겨받은 keyword들로 새로  insert를 시켜버린다		
		String[] keywordArr = keyword.split("#");
		ingService.insertNewKeyword(iNum, keywordArr);
		
		model.addAttribute("msg", "재료정보를 수정하였습니다!")
		.addAttribute("iNum", iNum)
		.addAttribute("iName", iName)
		.addAttribute("cName", cName)
		.addAttribute("subCName", subCName)
		.addAttribute("exdate", exdate)
		.addAttribute("keyword", keywordArr);
		}catch(Exception e){
			throw new PotException("재료관리 페이지 오류!","재료키워드를 업데이트 하던 도중 에러가 발생했습니다");
		}
		
		return "admin/adminResultPage";
	}
	
	@ResponseBody
	@RequestMapping("admin/insertNewCategory.do")
	public int insertNewCategory(@RequestParam String bigCategory, @RequestParam String text){
		ArrayList<Ingredient> list = (ArrayList<Ingredient>)ingService.selectCategoryFirstChar();
		//곡류 = A, 채소 = B (카테고리 앞 알파벳)
		HashMap<String, String> map1 = new HashMap<String, String>();
		
		//곡류 = 4, 채소 = 3 (카테고리별 최고 숫자)
		HashMap<String, Integer> map2 = new HashMap<String, Integer>();
		
		for(int i = 0; i< list.size();i++){
			if(i != 0 && i != list.size()-1){ // i가 맨끝과 맨처음 사이일때
				if(!list.get(i).getcName().equals(list.get(i-1).getcName())){
					String cName = list.get(i).getcName();
					String categoryIndex = list.get(i).getCategory().substring(0,1);				
					
					String preCName = list.get(i-1).getcName();
					int categoryMaxNumber = Integer.parseInt(list.get(i-1).getCategory().substring(1));
					
					map1.put(cName, categoryIndex);
					map2.put(preCName, categoryMaxNumber);
				}
			}else if(i == list.size()-1){ //i가 마지막 순번일때				
				map2.put(list.get(i).getcName(), Integer.parseInt(list.get(i).getCategory().substring(1)));
			}else{	// i ==0 일때
				map1.put(list.get(i).getcName(), list.get(i).getCategory().substring(0,1));
			}
			
			System.out.println("sub카테고리들은 들어오나? : "+list.get(i).getSubCName());
		}
		/*System.out.println("map1의 크기는? : "+map1.size());
		System.out.println("map2의 크기는? : "+map2.size());
		System.out.println("map1은 ? : "+map1.toString());
		System.out.println("map2는 ? : "+map2.toString());*/
		
		//준비는 끝났다! 이제 들어온 text가 기존의 세부 카테고리와 겹치지는 않는지 검사해보자
		for(int i=0; i<list.size();i++){
			if(list.get(i).getSubCName().equals(text)){
				return -1;
			}
		}
		
		// 검사 통과! 이제 insert를 진행해보자
		String newSubCName = text;
		String newCategory = map1.get(bigCategory)+(map2.get(bigCategory)+1);		
		
		int result = ingService.insertNewCategory(newCategory, newSubCName, bigCategory);
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("admin/deleteCategory.do")
	public int deleteCategory(@RequestParam String cName, @RequestParam String subCName){
				
		return ingService.deleteCategory(cName, subCName);
	}
	
	@RequestMapping("admin/insertNewIngredient.do")
	public String insertNewIngredient(Model model, @RequestParam MultipartFile[] addForUpload,
			@RequestParam String bigCategory,
			@RequestParam String subCategory, 
			@RequestParam String ingName, @RequestParam String exdate,
			HttpServletRequest request)throws PotException{
		
		int result = 0;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/img/ingredient");
		File dir = new File(saveDir);
				
		// 만약 현재 저장하려는 경로에 폴더가 없다면 만들겠습니다!
		if(!dir.exists()){
			System.out.println("dir.mkdirs() = "+dir.mkdirs());
		}
		
		String renameFileName = "";
		try{
		if(addForUpload.length >0){
			if(!addForUpload[0].isEmpty()){
			String originFileName = addForUpload[0].getOriginalFilename(); // 원본파일 이름
			String ext = originFileName.substring(originFileName.lastIndexOf(".")+1); //확장자
			
			//이름을 새로 만들어서 변경해준다
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");			
			int randomNum = (int)(Math.random() * 1000);			
			renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"_"+randomNum+"."+ext;
			
			//새로만든 이름으로 저장경로에 저장시킨다
			try {
				addForUpload[0].transferTo(new File(saveDir+"/"+renameFileName));
			} catch (IllegalStateException | IOException e) {					
				e.printStackTrace();
			}	
			
			// 정보들을 테이블에 insert 시킨다
			//INAME, CATEGORY, IIMAGE, EXDATE 가 필요하다
			String iName = ingName;
			String img = renameFileName;
			String category = ingService.selectCategoryCode(subCategory);
			//카테고리는 하위카테고리 명을 가지고 select해서 가져와야한다..		
			
			//insert하러 간다!
			result = ingService.insertNewIngredient(iName, img, category, exdate);	
			
			
			//키워드에 자기 자신의 이름을 자동으로 입력해줘야한다
			
			//1. 재료의 iNum을 가져와야해..
			ArrayList<Ingredient> list= (ArrayList<Ingredient>)ingService.showIngSearchResult(iName);
			int iNum = list.get(0).getiNum();
			//2. 재료의 iNum으로 키워드를 넣는다
			//INSERT INTO INGREDIENT_KEYWORD VALUES(#{iNum}, #{keyword})
			String [] keywordArr = {"", iName};	// 서비스단에서 index =1 부터 불러온다..		
			ingService.insertNewKeyword(iNum, keywordArr);
			model.addAttribute("iNum", iNum)
			.addAttribute("iName", ingName)
			.addAttribute("keyword", keywordArr)
			.addAttribute("cName", bigCategory)
			.addAttribute("subCName", subCategory)
			.addAttribute("exdate", exdate)
			.addAttribute("img", img);
		}
	}	
		
		model.addAttribute("msg","새로운 재료를 추가하였습니다!");
		}catch(Exception e){
			throw new PotException("재료관리 페이지 오류!", "새로운 재료를 추가하는 도중 에러가 발생했습니다");
		}	
		
		return "admin/adminResultPage"; 
	}
	
	@ResponseBody
	@RequestMapping("/admin/updateExpelMember.do")
	public int updateExpel(@RequestParam int mNum){
		
		//바꿔야 하는 것들(mId, password, mName)			
		
		Random ran = new Random();
		
		String mId = String.valueOf((int)(ran.nextDouble()*1000000));
		int password = (int)(ran.nextDouble()*1000000);
		
		System.out.println("아이디: "+mId);		
		System.out.println("비번: "+password);		
		
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		
		String newPw = bcrypt.encode(String.valueOf(password));
		//1. Member Table에서 강제탈퇴 처리
		adminService.updateExpelMember(mId, newPw, mNum);
		
		//2. Board, Board_Comment, Fridge, Recipe, Review, Review_Comment 테이블에서 해당 회원의 글들은 모조리 삭제시켜라!
		int result = adminService.deleteAllContent(mNum);
		System.out.println("result는?: "+result);
		return mNum;
	}
	
	// 신고게시판
	@RequestMapping("/admin/goReport.do")
	public String goReport(Model model, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage) throws PotException{
		model.addAttribute("commonTitle","신고 게시판");
		
		/*String bCategory = "QNA";*/
		int numPerPage = 10; // 한 페이지 당 게시글 수
			
		try{
		ArrayList<Report> list = (ArrayList<Report>) adminService.selectReport(cPage, numPerPage);
		
		int totalContents = adminService.selectReportCount();
		
		System.out.println("list : "+list);	
		
		model.addAttribute("list",list)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("totalContents", totalContents)
		.addAttribute("detailMapping","detailReport.do")
		.addAttribute("servletMapping", "goReport.do");
		}catch(Exception e){
			throw new PotException("신고게시판 오류!","신고게시판을 불러오던 도중 에러가 발생했습니다");
		}
		return "admin/adminReport";
	}
	
	//신고게시판 내용보기!
	@RequestMapping("/admin/detailReport.do")
	public String detailReport(Model model, @RequestParam int rpNum)throws PotException{			
			
		model.addAttribute("commonTitle","신고 게시판");
		
		try{
		// 특정 게시글의 내용을 불러온다	
		Report r = adminService.selectReportDetail(rpNum);			
		model.addAttribute("b", r); 
		
		Recipe rp = adminService.selectReportedRecipe(rpNum);
		model.addAttribute("rp", rp);
		
		model.addAttribute("detailMapping","detailReport.do")
		.addAttribute("servletMapping", "goReport.do")
		.addAttribute("mId", "admin")		// 임시적으로 회원의 정보를 넘겨주기 (나중에 로그인합쳐지면 세션으로 받기)
		.addAttribute("mNum", 1);			// 임시적으로 회원의 정보를 넘겨주기
		}catch(Exception e){
			throw new PotException("신고게시판 오류!","신고글을 읽어오던 도중 에러가 발생했습니다");
		}
		return "admin/adminReport_Detail";
	}
	
	//신고받은 레시피 삭제하기
	@ResponseBody
	@RequestMapping("/admin/deleteRecipe.do")
	public int deleteRecipe(@RequestParam int rNum){
		
		return adminService.deleteRecipe(rNum);			
	}
	
}
