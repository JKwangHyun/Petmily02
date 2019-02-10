package aaa.bbb.ccc.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aaa.bbb.ccc.util.AdoptionService;

@Controller
public class AdoptionController {
	@Autowired
	private AdoptionService mDao ;
	
	@RequestMapping(value="/registration")
	public String registration() {
		return "adoption/registration";
	}

	@RequestMapping(value="/Aregistration")
	public ModelAndView Aregistration(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map)
					throws ServletException, IOException {
		
		mDao.registration(map);
		mav.setViewName("test1");
		return mav ;
	}
}
