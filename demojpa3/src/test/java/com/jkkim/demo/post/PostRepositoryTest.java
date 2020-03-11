package com.jkkim.demo.post;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@DataJpaTest
public class PostRepositoryTest {

    @Autowired
    PostRepository postRepository;

    @Test
    public void crud(){
        Post post = new Post();
        post.setTitle("Spring jpa custom");

        assertThat(postRepository.contains(post)).isFalse();
        postRepository.save(post);
        assertThat(postRepository.contains(post)).isTrue();
        postRepository.delete(post);
        postRepository.flush();

    }

}