package com.dangdangs.board.service;

import java.util.List;

import com.dangdangs.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> selectAllBoard(String query);
	public BoardVO selectResultBoard(int bno);
	public List<BoardVO> selectBnoBySpcode(String spcode);
	public List<String> selectSynameByBno(int bno);
}
