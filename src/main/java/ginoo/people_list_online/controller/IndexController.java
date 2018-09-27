package ginoo.people_list_online.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ginoo.people_list_online.service.PeopleService;

@Controller
public class IndexController {
	@Autowired
	private PeopleService ps;
	public PeopleService getPs() {
		return ps;
	}
	public void setPs(PeopleService ps) {
		this.ps = ps;
	}
	@RequestMapping("/insertPeople.do")
	public String insertPeople(HttpServletRequest request,String peopleName,String peopleSex,Integer peopleAge) {
		request.setAttribute("result", ps.doInsertPeople(peopleName, peopleSex, peopleAge));
		return "/showIndex.do";
	}
	@RequestMapping("/showIndex.do")
	public String showIndex(HttpServletRequest request) {
		request.setAttribute("peoples", ps.getAllPeople());
		return "/index.jsp";
	}
	@RequestMapping("/removePeople.do")
	public String removePeople(HttpServletRequest request,String peoplesId) {
		request.setAttribute("result", ps.doRemovePeople(peoplesId));
		return "/showIndex.do";
	}
	
	@RequestMapping("/insertPeopleByAjax.ajax")
	public @ResponseBody String insertPeopleByAjax(HttpServletRequest request,String peopleName,String peopleSex,Integer peopleAge) {
		System.out.println(123);
		ps.doInsertPeople(peopleName, peopleSex, peopleAge);
		return "SUCCESS";	
	}
	@RequestMapping("/showIndexByAjax.ajax")
	public @ResponseBody String showIndexByAjax() {
		return ps.getAllPeopleByAjax();
	}
	@RequestMapping("/batchRemoves.ajax")
	public void batchRemoves(HttpServletRequest request,HttpServletResponse response) {
		String items = request.getParameter("delitems");
		String[] strs = items.split(",");
		
		for(int i=0;i<strs.length;i++) {
			try {
				ps.doRemovePeople(strs[i]);
			} catch (Exception e) {
			}
		}
	}
	
}
