package com.dangdangs.pet.service;

import java.util.List;

>>>>>>> 09b753d154d9ddd5f7f491d0dcb78f36d51c8e78
import com.dangdangs.pet.vo.PetVO;

public interface PetService {
	
	public void insertPet(PetVO petVO);

	public List<PetVO> selectPet(String mid);
}
