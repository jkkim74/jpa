package com.jkkim.demo.post;

import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PostRepositoryTestCfg {

    @Bean
    public ApplicationListener<PostPublishedEvent> postListener() {
        return postPublishedEvent -> {
            System.out.println("-----------------------------");
            System.out.println(postPublishedEvent.getPost().getTitle() + "-- Listening Event ---");
        };

    }
}
