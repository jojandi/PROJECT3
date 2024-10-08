package project3.gamja.mesPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.gamja.mesPage.dto.MesBuserDTO;


@Mapper
public interface BuserDAO {
    
    // 특정 user_id2로 사용자 조회
    List<MesBuserDTO> selectBuser(@Param("user_id2") String user_id2);
    
    // 모든 사용자 조회
    List<MesBuserDTO> selectAllBusers();
}