package com.dangdangs;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dangdangs.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/**/*.xml")
public class MemberTest {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Test
	public void mapperTest() throws Exception{
		MemberVO membervo = new MemberVO();
		membervo.setMnick("gouny2");
		membervo.setMpassword("1234");
		membervo.setMid("goun");
		System.out.println(": "+ ss.update("member.dao.MemberDAO.updateMember", membervo));
	}
	
}
