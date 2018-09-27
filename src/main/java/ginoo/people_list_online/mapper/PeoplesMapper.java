package ginoo.people_list_online.mapper;

import java.util.List;

import ginoo.people_list_online.modal.Peoples;

public interface PeoplesMapper {
    int deleteByPrimaryKey(String peoplesId);

    int insert(Peoples record);

    int insertSelective(Peoples record);

    Peoples selectByPrimaryKey(String peoplesId);

    int updateByPrimaryKeySelective(Peoples record);

    int updateByPrimaryKey(Peoples record);
    
    List<Peoples> selectAll();
}