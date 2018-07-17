package com.kh.pot.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.pot.board.model.service.BoardService;

@Controller
public class HomeController {

	
	@Autowired
	BoardService boardService;
	
	
}
