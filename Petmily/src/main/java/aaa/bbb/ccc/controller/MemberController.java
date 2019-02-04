package aaa.bbb.ccc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import aaa.bbb.ccc.util.MemberService;
import aaa.bbb.ccc.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService mDao ;
	
	@RequestMapping(value="/")
	public String home() {
		return "test1";
	}
	
	@RequestMapping(value="/home")
	public String home1() {
		return "test1";
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.memberDetail(mvo);
		HttpSession session = request.getSession() ;
		session.setAttribute("Login", mvo);

		mav.addObject("idcheck", mvo);
		mav.setViewName("member/logincheck");
		return mav;
	} // login	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav)  
			throws ServletException, IOException {
		HttpSession session = request.getSession() ;
		session.invalidate();
		
		mav.setViewName("redirect:home");
		return mav;
	} // logout
	
	@RequestMapping(value="/idcheck")
	public ModelAndView joinCheck(HttpServletRequest request, ModelAndView mav, MemberVO mvo)  
			throws ServletException, IOException {
		mvo = mDao.idcheck(mvo);

		mav.addObject("idcheck", mvo);
		mav.setViewName("member/idcheck");
		return mav;
	} // idcheck
	
}