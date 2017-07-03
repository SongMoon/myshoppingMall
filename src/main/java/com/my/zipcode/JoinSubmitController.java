package com.my.zipcode;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinSubmitController {
	
	  @Autowired
	    private MemberDAOService memberDAOService;
	 @RequestMapping(value="/member/join_action", method=RequestMethod.POST)
	    public ModelAndView insertJoin(@RequestParam("mem_id") String mem_id,@RequestParam("mem_email") String mem_email
	     ,@RequestParam("mem_passwd1") String mem_passwd1, @RequestParam("mem_phone") String mem_phone
	     ,@RequestParam("chk_admin") String chk_admin,@RequestParam("mem_birth") String mem_birth,
	     @RequestParam("postcode") String postcode,@RequestParam("roadAddress") String roadAddress,@RequestParam("jibunAddress") String jibunAddress) {
	     
	       ModelAndView view = new ModelAndView();
	       Member member = new Member();
	       member.setMid(mem_id);
	       member.setPassword(mem_passwd1);
	       member.setEmail(mem_email);
	       member.setPhone(mem_phone);
	       member.setJibunAddress(jibunAddress);
	       member.setRoadAddress(roadAddress);
	       member.setBirth(mem_birth);
	       member.setPostcode(postcode);
	       
	       member.setAdmin(chk_admin);
	     
	       memberDAOService.insertMember(member);
	       
	       view.setViewName("/member/result");
	       
	       return view;
	    }
}