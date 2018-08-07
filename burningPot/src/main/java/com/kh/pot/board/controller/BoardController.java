package com.kh.pot.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pot.admin.model.vo.PageInfo;
import com.kh.pot.board.model.service.BoardService;
import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;
import com.kh.pot.common.exception.PotException;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	/*게시판 리스트 페이지로 이동*/
	@RequestMapping("/board/boardList.do")
	public String boardList(
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="searchBoard", required=false, defaultValue="") String searchBoard,
			@RequestParam(value="searchCondition", required=false, defaultValue="sAll") String searchCondition,
			@RequestParam(value="searchType", required=false, defaultValue="allCon") String searchType,
			Model model){
		try{
			/*페이징 처리 코드 부분*/
			int startPage;		//한번에 표시될 게시글들의 시작 페이지
			int endPage;		//한번에 표시될 게시글들의 마지막 페이지
			int maxPage;		//전체 페이지의 마지막 페이지
			int numPerPage = 10;	// 한 페이지 당 게시글 수
			
			// 1. 전체 게시글 수 구하기
			int totalContents = boardService.selectBoardTotalContents(searchBoard, searchCondition, searchType);
			
			
			/*페이징 계산*/
			// 총 게시글 수에 대한 페이지 계산
			// EX> 목록의 수가 123 개라면 페이지 수는 13페이지가 된다.
			//     짜투리 게시글도 하나의 페이지로 취급해야 한다.
			// 10/1 --> 0.9를 더하여 하나의 페이지로 만든다.
			maxPage = (int)((double)totalContents / numPerPage + 0.9);
			
			// 첫 페이지의 번호
			// ex) 한 화면에 10개의 페이지를 표시하는 경우 
			startPage =(((int)((double)currentPage / numPerPage + 0.9))-1)*numPerPage +1;
			
			// 한 화면에 표시할 마지막 페이지 번호
			endPage = startPage + numPerPage -1;
			
			// 10페이지 까지 내용이 안 찰 경우
			if(maxPage <endPage) {
				endPage=maxPage;
			}
			
			// 페이지 관련 변수 전달용 VO 생성
			PageInfo pi = new PageInfo(currentPage, totalContents, numPerPage, startPage, endPage, maxPage);
			/*페이징 계산*/
			
			// 2. 현재 페이지 컨텐츠 리스트 받아오기
			List<Map<String, String>> list = boardService.selectBoardList(currentPage, numPerPage, searchBoard, searchCondition, searchType);
			
			model.addAttribute("list", list).addAttribute("pi",pi);
			
			
			if(searchBoard !=null || searchBoard!="") model.addAttribute("searchBoard",searchBoard);
			if(searchCondition != null || searchCondition != "") model.addAttribute("searchCondition",searchCondition);
			if(searchType !=null || searchType!="") model.addAttribute("searchType",searchType);
		
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "게시판을 불러오는 도중 에러가 발생했습니다");
		}
		return "board/boardList";
	}
	
	/*게시판 상세보기 페이지로 이동*/
	@RequestMapping("/board/boardDetail.do")
	public String boardDetail(@RequestParam("no") int boardNo, Model model){
		model.addAttribute("board", boardService.selectBoardOne(boardNo));
		model.addAttribute("boardComList",boardService.selectBoardComment(boardNo));
		model.addAttribute("preNexList");
		return "board/boardDetail";
	}
	
	/*게시판 글쓰기 페이지로 이동*/
	@RequestMapping("/board/insertBoard.do")
	public String insertBoard(Model model){
		return "board/insertBoard";
	}
	
	// 게시글 저장
	@RequestMapping(value="/board/insertBoardEnd.do", method=RequestMethod.POST)
	public String insertBoardEnd(Board board, Model model){
		
		String msg = "";
		String loc ="/board/boardList.do";
		try{
			int result = boardService.insertBoard(board);
			
			if(result > 0) {
				msg="글쓰기가 완료되었습니다.";
				loc="/board/boardDetail.do?no="+board.getbNum();
			} else msg="글쓰기가 저장되지 않았습니다.";
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "게시글을 저장하는 도중 에러가 발생했습니다");
		}
		return "common/msg";
	}
	
	// 게시글 수정페이지 이동
	@RequestMapping(value="/board/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(@RequestParam("no") int boardNo, Model model){
		model.addAttribute("board",boardService.selectBoardOne(boardNo));
		return "board/updateBoard";
	}
	
	// 게시글 수정 
	@RequestMapping(value="/board/updateBoardEnd.do", method = RequestMethod.POST)
	public String updateBoardEnd(Board board, Model model){
		
		String msg="";
		String loc ="/board/boardList.do";
		try{
			int result = boardService.updateBoard(board);
					
			if(result > 0) {
				msg="수정이 완료되었습니다.";
				loc="/board/boardDetail.do?no="+board.getbNum();
			} else msg="수정이 실패했습니다.";
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);	
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "게시글을 수정하는 도중 에러가 발생했습니다");
		}
		return "common/msg";
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board/deleteBoard.do", method=RequestMethod.POST)
	public String deleteBoard(@RequestParam("no") int boardNo, Model model){
		
		String msg="";
		String loc ="/";
		try{
			int result = boardService.deleteBoard(boardNo);
					
			if(result > 0) {
				msg="삭제가 완료되었습니다.";
				loc="/board/boardList.do";
			} else msg="삭제를 실패했습니다.";
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);	
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "게시글을 삭제하는 도중 에러가 발생했습니다");
		}
		return "common/msg";
	}
	
	// 댓글 등록
	@RequestMapping(value="/board/InsertBoardComment.do", method = RequestMethod.POST)
	public String InsertBoardComment(BoardComment bc, Model model){
		String msg="";
		String loc ="/board/boardList.do";
		try{
			int result = 0;
			
			if(bc.getmId().equals("admin")){
				result += boardService.updateBoardReply(bc.getbNum(), true);
			}
			
			result += boardService.insertBoardCo(bc);
	
			if(result > 0) {
				msg="댓글등록이 완료되었습니다.";
				return "redirect:/board/boardDetail.do?no="+bc.getbNum();
			} else msg="댓글등록이 실패했습니다.";
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);	
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "댓글을 등록하는 도중 에러가 발생했습니다");
		}
		return "common/msg";
	}
	
	// 댓글 삭제
	@RequestMapping(value="/board/deleteBoardComment.do", method=RequestMethod.POST)
	public String deleteBoardComment(@RequestParam("bcNum") int bcNum,
									 @RequestParam("bNum") int bNum,
									 Model model){
		String msg="";
		String loc ="/board/boardList.do";
		try{
			int result = boardService.deleteBoardComment(bcNum);
			
			if(result > 0 ) {
				msg="댓글이 삭제되었습니다.";
				return "redirect:/board/boardDetail.do?no="+bNum;
			} else msg="댓글삭제가 실패했습니다.";
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);	
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "댓글을 삭제하는 도중 에러가 발생했습니다");
		}
		return "common/msg";
	}
	
	// 댓글 수정
	@RequestMapping(value="/board/updateBoardComment.do", method=RequestMethod.POST)
	public String updateBoardComment(BoardComment bc, Model model){
		String msg="";
		String loc="/board/boardList.do";
		
		try{
			int result = boardService.updateBoardComment(bc);
			
			if(result > 0) return "redirect:/board/boardDetail.do?no="+bc.getbNum();
			else msg="댓글 수정에 실패하였습니다.";
			
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		} catch (Exception e) {
			throw new PotException("게시판 오류!", "댓글을 수정하는 도중 에러가 발생했습니다");
		}
		return "common/msg";
	}
	
}