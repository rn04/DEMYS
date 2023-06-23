package com.ducks.demys.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashBoardController {
	@RequestMapping("/common/head")
	public String showJoin() {
		return "/common/head";
	}

}
