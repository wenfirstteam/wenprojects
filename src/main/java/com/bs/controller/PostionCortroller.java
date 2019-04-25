package com.bs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/position")
public class PostionCortroller
{

	@PostMapping()
	public @ResponseBody ResponseBody addPosition() {
		return null;
	}
}
