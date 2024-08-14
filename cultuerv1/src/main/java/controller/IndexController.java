package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	
	@RequestMapping("/")
	public String homepage() {
		return "homepage";
	}
	@GetMapping("/top3")
	public String top3() {
		return "top3";
	}
	@GetMapping("/homepage")
	public String homepage1() {
		return "homepage";
	}
	@GetMapping("/event1")
	public String event1() {
		return "event1";
	}
	@GetMapping("/event2")
	public String event2() {
		return "event2";
	}
	@GetMapping("/event3")
	public String event3() {
		return "event3";
	}
	@GetMapping("/loginpage")
	public String loginpage() {
		return "loginpage";
	}
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
}
