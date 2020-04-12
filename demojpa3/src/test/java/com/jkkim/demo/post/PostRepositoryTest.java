package com.jkkim.demo.post;

import com.querydsl.core.types.Predicate;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@DataJpaTest
@Import(PostRepositoryTestCfg.class)
public class PostRepositoryTest {

    @Autowired
    PostRepository postRepository;

    @Autowired
    ApplicationContext applicationContext;


    @Test
    public void event() {
        Post post = new Post();
        post.setTitle("post");
        PostPublishedEvent event = new PostPublishedEvent(post);
        applicationContext.publishEvent(event);
    }

    @Test
    public void crud() {
        Post post = new Post();
        post.setTitle("Spring jpa custom");
        postRepository.save(post.publish());

        Predicate predicate = QPost.post
                .title.containsIgnoreCase("jpa");

        Optional<Post> one = postRepository.findOne(predicate);
        assertThat(one).isNotEmpty();

    }

    @Test
    public void testList() {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);

        List<Integer> list2 = new ArrayList<>();
        list2.add(6);
        list2.add(7);
        list2.add(8);

        list.addAll(1, list2);

        System.out.println(list.toString());
    }

}