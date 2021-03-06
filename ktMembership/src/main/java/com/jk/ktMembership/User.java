package com.jk.ktMembership;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class User {
    @Id
    @GeneratedValue
    private Long mbrId;

    private String name;

    private String birthDay;

    @Temporal(TemporalType.TIMESTAMP)
    private Date created = new Date();

    public Long getMbrId() {
        return mbrId;
    }

    public void setMbrId(Long mbrId) {
        this.mbrId = mbrId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    @Override
    public String toString() {
        return "User{" +
                "mbrId=" + mbrId +
                ", name='" + name + '\'' +
                ", birthDay='" + birthDay + '\'' +
                ", created=" + created +
                '}';
    }
}
