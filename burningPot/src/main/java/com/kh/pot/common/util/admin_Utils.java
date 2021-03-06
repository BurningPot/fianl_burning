package com.kh.pot.common.util;
//여기에서 페이지네이션 디자인을 할 수 있다
public class admin_Utils {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url, int mNum ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
	
		int pageNo = (int)(((cPage - 1)/pageBarSize) * pageBarSize) +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		System.out.println("----------시작부분----------");
		System.out.println("cPage: "+cPage);
		System.out.println("pageNo: "+pageNo);
		System.out.println("totalPage: "+totalPage);
		System.out.println("--------------------");
		
	
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(cPage == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage-1)+", "+mNum+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){

			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+", "+mNum+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		//내가 새로추가한 부분
		pageNo = (int)(((cPage - 1)/pageBarSize) * pageBarSize) +1;
		System.out.println("----------다음부분----------");
		System.out.println("cPage: "+cPage);
		System.out.println("pageNo: "+pageNo);
		System.out.println("totalPage: "+totalPage);
		System.out.println("--------------------");
		//[다음] section
		if(cPage >= totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+", "+mNum+")'>다음</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,mNum){";
		pageBar += "location.href='"+url+"?cPage='+cPage+'&mNum='+mNum;";
		pageBar += "}";
		pageBar += "</script>";
		
		
		return pageBar; 
	}

}
