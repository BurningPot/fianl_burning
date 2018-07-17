package com.kh.pot.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.pot.board.model.service.BoardService;
import com.kh.pot.fridge.model.service.FridgeService;

@Controller
public class MainController {

	
	@Autowired
	BoardService boardService; 
	
	@Autowired
	FridgeService fridgeService;
	
	
	
}
