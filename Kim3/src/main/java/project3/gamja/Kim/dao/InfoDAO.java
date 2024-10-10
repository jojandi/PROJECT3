package project3.gamja.Kim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.gamja.Kim.dto.NotiDTO;
import project3.gamja.Kim.dto.RequestDTO;

@Mapper
public interface InfoDAO {

	// 공지사항
	List<NotiDTO> selectAnnouncement();

//	List<NotiDTO> selectAnnouncement(NotiDTO notiDTO);
	
	int insertAnnouncements(NotiDTO notiDTO);
	
	NotiDTO selectSeq(int seq);
	
	List<NotiDTO> selectAnnouncement(NotiDTO invenDTO);
	int totalnoti();
	
//	도서신청
	List<RequestDTO> selectapplication();
	
	int insertapplication(RequestDTO requestDTO);
	
	int updateapplication(RequestDTO requestDTO);

	
	}


