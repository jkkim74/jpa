package com.jk.ktMembership;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

public class BioConverter {
    @Component
    public static class StringToUserConverter implements Converter<String,User> {

        @Override
        public User convert(String source) {
            User user = new User();
            user.setBirthDay(source);
            return user;
        }
    }
    @Component
    public static class UserToStringConverter implements Converter<User,String>{

        @Override
        public String convert(User source) {
            return source.getBirthDay();
        }
    }
}
