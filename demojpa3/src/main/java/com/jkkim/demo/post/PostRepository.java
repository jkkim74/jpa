package com.jkkim.demo.post;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends MyRepository<Post,Long> {
}
