package com.jk.ktMembership;

import java.util.List;

import javax.swing.text.html.Option;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PhotoBookSeqRepository extends  JpaRepository<PhotobookSeq,Long> {
	@Query(value="select  lpad(currval,12,0) as currval FROM photobook_seq WHERE NAME='photobook_seq_20'",nativeQuery = true)
	public List<String> findCurrval();
}
