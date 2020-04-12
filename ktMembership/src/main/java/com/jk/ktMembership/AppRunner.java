package com.jk.ktMembership;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
@Transactional
public class AppRunner implements ApplicationRunner {

    @Autowired
    UserRepository userRepository;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        // TODO Auto-generated method stub
//		User user = new User();
//		user.setName("jkkim");
//		
//		userRepository.save(user);
//		
//		User user2 = new User();
//		user2.setName("eunhye");
//		
//		userRepository.save(user2);
//		
//		User user3 = new User();
//		user3.setName("anyOne");
//		
//		userRepository.save(user3);
//		
//		User user4 = new User();
//		user4.setName("user4");
//		
//		userRepository.save(user4);
//		
//		User user5 = new User();
//		user5.setName("user5");
//		
//		userRepository.save(user5);


    }

}
