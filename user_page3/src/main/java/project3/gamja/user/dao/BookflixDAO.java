package project3.gamja.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project3.gamja.user.dto.BookflixDTO;
@Mapper
public interface BookflixDAO {
    List<BookflixDTO> bookflix_user(@Param("seq") int seq);
}
