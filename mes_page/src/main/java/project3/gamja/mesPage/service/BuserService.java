package project3.gamja.mesPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.BuserDAO;
import project3.gamja.mesPage.dao.MainDAO;
import project3.gamja.mesPage.dto.MesBuserDTO;
import project3.gamja.mesPage.dto.MesMainDTO;


@Service
public class BuserService {

    @Autowired
    private BuserDAO buserDAO;

    // user_id2가 있으면 selectBuser 호출, 없으면 selectAllBusers 호출
    public List<MesBuserDTO> selectBuser(String user_id2) {
        if (user_id2 != null && !user_id2.isEmpty()) {
            return buserDAO.selectBuser(user_id2);
        } else {
            return buserDAO.selectAllBusers();
        }
    }
}