package ginoo.people_list_online.service;

import java.util.List;

import ginoo.people_list_online.modal.Peoples;

public interface PeopleService {
	String doInsertPeople(String peopleName,String peopleSex,Integer peopleAge);
	
	List<Peoples> getAllPeople();
	
	String doRemovePeople(String peoplesId);
	
	String getAllPeopleByAjax();
}
