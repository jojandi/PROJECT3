package project3.gamja.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.user.dao.BookflixDAO;
import project3.gamja.user.dto.BookflixDTO;

@Service
public class BookflixService {

	  @Autowired
	    private BookflixDAO bookflixDAO;

	  public List<BookflixDTO> getUserBookflix(int seq) {
	        List<BookflixDTO> list = bookflixDAO.bookflix_user(seq);
	        if (list == null || list.isEmpty()) {
	            // 리스트가 비었을 때의 처리
	            System.out.println("리스트가 비어 있습니다.");
	        }
	        return list;
	    }
}
