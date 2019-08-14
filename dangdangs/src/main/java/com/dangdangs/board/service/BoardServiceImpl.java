package com.dangdangs.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangdangs.board.dao.BoardDAO;
import com.dangdangs.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardVO> selectAllBoard(String query) {
		return boardDAO.selectAll(query);
	}

	@Override
	public BoardVO selectResultBoard(int bno) {
		return boardDAO.selectResult(bno);
	}

	@Override
	public List<BoardVO> selectBnoBySpcode(String spcode) {
		
		return boardDAO.selectBnoBySpcode(spcode);
	}

	@Override
	public List<String> selectSynameByBno(int bno) {
		return boardDAO.selectSynameByBno(bno);
	}

	
}
