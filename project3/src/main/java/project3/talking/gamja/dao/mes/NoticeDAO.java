package project3.talking.gamja.dao.mes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project3.talking.gamja.dto.mes.MesNoticeDTO;


@Mapper
public interface NoticeDAO {
	
	List<MesNoticeDTO> selectNotice1(MesNoticeDTO dto);
	
	int totalNt1 (MesNoticeDTO dto);
	
	int insertNotice(MesNoticeDTO dto);
	
	MesNoticeDTO selectOne(MesNoticeDTO dto);
	int updateNotice(MesNoticeDTO dto);
	int deleteNotice(MesNoticeDTO dto);
	
	// 댓글기능
	int addComment(MesNoticeDTO dto);
	List<MesNoticeDTO> listNoti(MesNoticeDTO dto);
}
