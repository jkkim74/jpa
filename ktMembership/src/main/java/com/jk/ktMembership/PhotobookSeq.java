package com.jk.ktMembership;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="photobook_seq")
public class PhotobookSeq {
	
	@Id @GeneratedValue
	public Long id;
	
	public String name;
	
	public int currval;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCurrval() {
		return currval;
	}

	public void setCurrval(int currval) {
		this.currval = currval;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

}
