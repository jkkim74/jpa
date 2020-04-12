package com.jkkim.commonweb.post;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.repository.support.DomainClassConverter;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class PostControllerTest {

    @Autowired
    MockMvc mocMvc;

    @Autowired
    PostRepository postRepository;

    @Test
    public void getPost() throws Exception {

        Post post = new Post();
        post.setTitle("JPA");
        postRepository.save(post);

        mocMvc.perform(get("/posts/1"))
                .andDo(print())
                .andExpect(status().isOk());

    }
}