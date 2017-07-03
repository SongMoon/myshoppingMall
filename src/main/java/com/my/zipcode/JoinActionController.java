package com.my.zipcode;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.my.zipcode.Member;
import com.my.zipcode.MemberDAOService;
@Controller
public class JoinActionController {

	 @RequestMapping(value="/member/member_join", method=RequestMethod.GET)
	    public ModelAndView JoinForm (Locale locale, Model model) {
	     
	       ModelAndView view = new ModelAndView();
	       
	       view.setViewName("/member/member_join");
	       
	       return view;
	    }
}
