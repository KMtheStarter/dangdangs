package com.dangdangs.pet.service;

<<<<<<< HEAD
=======
import java.util.ArrayList;
import java.util.List;

>>>>>>> 09b753d154d9ddd5f7f491d0dcb78f36d51c8e78
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangdangs.pet.dao.PetDAO;
import com.dangdangs.pet.vo.PetVO;

@Service
public class PetServiceImpl implements PetService {

	@Autowired
	private PetDAO petDAO;

	
	@Override
	public void insertPet(PetVO petVO) {
		petDAO.insert(petVO);
	}


	@Override
	public List<PetVO> selectPet(String mid) {
		List<PetVO> petVO = petDAO.selectDpetByMid(mid);
		
		return petVO;
		
	}
	
}
