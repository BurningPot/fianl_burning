package com.kh.pot.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pot.board.model.service.BoardService;
import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	/*게시판 리스트 페이지로 이동*/
	@RequestMapping("/board/boardList.do")
	public String boardList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model){
	
		int numPerPage = 10;	// 한 페이지 당 게시글 수

		// 1. 현재 페이지 컨텐츠 리스트 받아오기
		List<Map<String, String>> list = boardService.selectBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 구하기
		int totalContents = boardService.selectBoardTotalContents();
		
		model.addAttribute("list", list).addAttribute("numPerPage",numPerPage).addAttribute("totalContents", totalContents);
		
		return "board/boardList";
	}
	
	/*게시판 상세보기 페이지로 이동*/
	@RequestMapping("/board/boardDetail.do")
	public String boardDetail(@RequestParam("no") int boardNo, Model model){
		model.addAttribute("board", boardService.selectBoardOne(boardNo));
		model.addAttribute("boardComList",boardService.selectBoardComment(boardNo));
		return "board/boardDetail";
	}
	
	/*게시판 글쓰기 페이지로 이동*/
	@RequestMapping("/board/insertBoard.do")
	public String insertBoard(Model model){
		return "board/insertBoard";
	}
	
	// 게시글 저장
	@RequestMapping("/board/insertBoardEnd.do")
	public String insertBoardEnd(Board board, Model model){
		
		String msg = "";
		String loc ="/board/boardList.do";
		
		int result = boardService.insertBoard(board);
		
		if(result > 0) {
			msg="글쓰기가 완료되었습니다.";
			loc="/board/boardDetail.do?no="+board.getbNum();
		} else msg="글쓰기가 저장되지 않았습니다.";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 게시글 수정페이지 이동
	@RequestMapping("/board/updateBoard.do")
	public String updateBoard(@RequestParam("no") int boardNo, Model model){
		model.addAttribute("board",boardService.selectBoardOne(boardNo));
		return "board/updateBoard";
	}
	
	// 게시글 수정 
	@RequestMapping(value="/board/updateBoardEnd.do", method = RequestMethod.POST)
	public String updateBoardEnd(Board board, Model model){
		
		String msg="";
		String loc ="/board/boardList.do";
		System.out.println("boardUpdate: "+board);
		
		int result = boardService.updateBoard(board);
				
		if(result > 0) {
			msg="수정이 완료되었습니다.";
			loc="/board/boardDetail.do?no="+board.getbNum();
		} else msg="수정이 실패했습니다.";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);	
		
		return "common/msg";
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board/deleteBoard.do")
	public String deleteBoard(@RequestParam("no") int boardNo, Model model){
		
		String msg="";
		String loc ="/";
		
		int result = boardService.deleteBoard(boardNo);
				
		if(result > 0) {
			msg="삭제가 완료되었습니다.";
			loc="/board/boardList.do";
		} else msg="삭제를 실패했습니다.";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);	
		
		return "common/msg";
	}
	
	// 댓글 등록
	@RequestMapping(value="/board/InsertBoardComment.do", method = RequestMethod.POST)
	public String InsertBoardComment(BoardComment bc, Model model){
		String msg="";
		String loc ="/board/boardList.do";
		
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
		
		return "common/msg";
	}
	
	// 댓글 삭제
	@RequestMapping(value="/board/deleteBoardComment.do")
	public String deleteBoardComment(@RequestParam("bcNum") int bcNum,
									 @RequestParam("bNum") int bNum,
									 Model model){
		String msg="";
		String loc ="/board/boardList.do";
		
		int result = boardService.deleteBoardComment(bcNum);
		
		if(result > 0 ) {
			msg="댓글이 삭제되었습니다.";
			return "redirect:/board/boardDetail.do?no="+bNum;
		} else msg="댓글삭제가 실패했습니다.";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);	
		
		return "common/msg";
	}

	
}