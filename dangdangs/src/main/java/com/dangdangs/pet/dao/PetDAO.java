package com.dangdangs.pet.dao;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> 09b753d154d9ddd5f7f491d0dcb78f36d51c8e78
import com.dangdangs.pet.vo.PetVO;

public interface PetDAO {
	public void insert(PetVO petVO);
	public String selectSpnameBySpcode(String spcode);

	public List<PetVO> selectDpetByMid(String mid);
}
