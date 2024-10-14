package project3.gamja.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.gamja.user.dto.BookflixDTO;
@Mapper
public interface BookflixDAO {
    List<BookflixDTO> bookflix_user(@Param("seq") int seq);
    int bookflix_review(@Param("user_seq") int userSeq,
            @Param("buser_seq") int buserSeq,
            @Param("review_score") int reviewScore,
            @Param("review_contents") String reviewContents);
    
    
    // 북플릭스 가입 처리
    int bookflix_sub(@Param("userSeq") int userSeq);

    // 북플릭스 유저 인서트
    int bookflix_subInsert(@Param("userSeq") int userSeq);

    // 북플릭스 유저 삭제
    int bookflix_del(@Param("buserSeq") int buserSeq);

    // 북플릭스 탈퇴 처리
    int bookflix_out(@Param("userSeq") int userSeq);
}

