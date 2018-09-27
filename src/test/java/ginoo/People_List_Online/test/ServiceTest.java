package ginoo.People_List_Online.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import ginoo.people_list_online.service.PeopleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class ServiceTest {
	@Autowired
	private PeopleService ps;
	
	public PeopleService getPs() {
		return ps;
	}
	public void setPs(PeopleService ps) {
		this.ps = ps;
	}
	
	@Test
	public void testGetAllPeople() {
		System.out.println(ps.getAllPeopleByAjax());
	}
	
	@Test
	@Transactional
	@Rollback
	public void testRemovePeople() {
		System.out.println(ps.doRemovePeople("cd388ec9-2e91-4413-b903-406e3f7893de"));
	}

}
