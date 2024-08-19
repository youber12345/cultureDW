package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.CultureDAO;
import DAO.CultureEvent;

@Service
public class CultureService {
	@Autowired
	CultureDAO dao;

	public List<CultureEvent> getCultureList() {
		
		return dao.getCultureList();
	}

	public CultureEvent getCulture(int eventNum) {
		return dao.getCulture(eventNum);
	}
}
