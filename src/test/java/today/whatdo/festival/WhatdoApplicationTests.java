package today.whatdo.festival;


import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import today.whatdo.festival.userinfo.mapper.UserInfoMapper;

@SpringBootTest
@Slf4j
class WhatdoApplicationTests {
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Test
	void contextLoads() {
		log.debug("userInfoList",userInfoMapper.selectUserInfoList(null));
	}
	
	

}
