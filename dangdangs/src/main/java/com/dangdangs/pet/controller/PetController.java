package com.dangdangs.pet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dangdangs.board.service.BoardService;
import com.dangdangs.board.vo.BoardVO;
import com.dangdangs.member.vo.MemberVO;
import com.dangdangs.pet.service.PetService;
import com.dangdangs.pet.vo.PetVO;

@Controller
public class PetController {

	@Autowired
	private PetService service;
	@Autowired
	private BoardService boardService;
	
	
	
	@GetMapping("/pet")
	public String petForm(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		// �α��� �Ǿ��� ��
		if (session.getAttribute("loginVO") != null) {
			return "member/pet";
		}
		else {
			model.addAttribute("msg", "�α��� �� �̿밡���մϴ�.");
			return "fail";
		}
	}
	
	@PostMapping("/pet")
	public String petForm(PetVO petVO) {
		service.insertPet(petVO);
		return "member/mypage";
	}

	@RequestMapping("mypage/{mid}")
	public String myPet(@PathVariable("mid") String mid, Model model) {
		
		System.out.println(mid);
		List<PetVO> list = service.selectPet(mid);
		model.addAttribute("petList", list);
		return "member/mypet";
	}
	
	@RequestMapping("mypage/mypet/{spcode}")
	public String myPetBoard(@PathVariable("spcode") String spcode, Model model) {
		
		List<BoardVO> list = boardService.selectBnoBySpcode(spcode);
		model.addAttribute("boardListBySp", list);
		return "board/listbysp";
	}
}