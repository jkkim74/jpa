package com.jk.ktMembership;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Login {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY)
    private Long mbrId;

    @Temporal(TemporalType.TIMESTAMP)
    private Date created = new Date();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMbrId() {
        return mbrId;
    }

    public void setMbrId(Long mbrId) {
        this.mbrId = mbrId;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

}
