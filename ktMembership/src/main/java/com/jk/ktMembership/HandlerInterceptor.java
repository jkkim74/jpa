package com.jk.ktMembership;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class HandlerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // TODO Auto-generated method stub

        String uri = request.getRequestURI();
        System.out.println("##############################################");
        System.out.println("URI : " + uri);
        System.out.println("##############################################");

        return super.preHandle(request, response, handler);
    }

}
