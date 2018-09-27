package ginoo.people_list_online.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import ginoo.people_list_online.mapper.PeoplesMapper;
import ginoo.people_list_online.modal.Peoples;
import ginoo.people_list_online.service.PeopleService;
@Service
public class PeopleServiceImpl implements PeopleService {
	
	private static final String SUCCESS = "SUCCESS";
	private static final String ERROR = "ERROR"; 
	
	@Autowired
	private PeoplesMapper pm;
	
	public PeoplesMapper getPm() {
		return pm;
	}

	public void setPm(PeoplesMapper pm) {
		this.pm = pm;
	}

	@Override
	public String doInsertPeople(String peopleName, String peopleSex, Integer peopleAge) {
		Peoples ps = new Peoples();
		ps.setPeoplesId(UUID.randomUUID().toString());
		ps.setPeoplesName(peopleName);
		ps.setPeoplesSex(peopleSex);
		ps.setPeoplesAge(peopleAge);
		try {
			return pm.insert(ps)>0?SUCCESS:ERROR;
		} catch (Exception e) {
			return ERROR;
		}
	}

	@Override
	public List<Peoples> getAllPeople() {
		
		return pm.selectAll();
	}

	@Override
	public String doRemovePeople(String peoplesId) {
		try {
			return pm.deleteByPrimaryKey(peoplesId)>0?SUCCESS:ERROR;
		} catch (Exception e) {
			return ERROR;
		}
	}

	@Override
	public String getAllPeopleByAjax() {
		List<Peoples> pss = getAllPeople();
		Gson g = new Gson();
		String json = g.toJson(pss);
		return json;
	}

}
