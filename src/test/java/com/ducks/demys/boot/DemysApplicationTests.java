package com.ducks.demys.boot;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

import com.ducks.demys.boot.repository.MemberRepository;

@SpringBootTest
class DemysApplicationTests {
	
	private MemberRepository memberRepository;
	
	public DemysApplicationTests(MemberRepository memberRepository) {
		this.memberRepository=memberRepository;
	}
	
	@Test
	void contextLoads() {
		Assert.notEmpty(memberRepository.getMemberList());
	}

}
