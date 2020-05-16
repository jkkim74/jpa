package com.jk.ktMembership;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@DataJpaTest
public class ProductRepositoryTest {
	
	@Autowired
	PhotoBookSeqRepository photoBookSeqRepository;
	
	@PersistenceContext
	EntityManager entityManager;
	
	@Test
	public void generateSeq() {
		
		List<String> strSeq = photoBookSeqRepository.findCurrval();
		
		//String sqlString = "select lpad(nextval(?1),12,0) as photobook_seq from DUAL";
		//entityManager.createNativeQuery(sqlString);
		System.out.println(strSeq.toString());
		
	}

}
