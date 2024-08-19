package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CultureController {
	@Autowired
	CultureService service;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", service.getCultureList());
		
		mv.setViewName("index"); // views/index.jsp 실행
		return mv;
	}
	
	@RequestMapping("/view")
	public ModelAndView view(int eventNum) {
		ModelAndView mv2 = new ModelAndView();
		mv2.addObject("gc", service.getCulture(eventNum));
		
		mv2.setViewName("view");
		System.out.println(service.getCulture(eventNum));
		return mv2;
	}
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
}
