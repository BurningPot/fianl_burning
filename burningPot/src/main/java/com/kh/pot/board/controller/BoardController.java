package com.kh.pot.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pot.board.model.service.BoardService;

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
		return "board/boardDetail";
	}
	
	/*게시판 글쓰기 페이지로 이동*/
	@RequestMapping("/board/insertBoard.do")
	public String insertBoard(Model model){
		return "board/insertBoard";
	}
	
}