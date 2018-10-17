package com.generator.Interceptor;

import com.generator.pojo.Admin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 */
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String admin = (String) request.getSession().getAttribute("adminName");

        String url = request.getRequestURI();

        if (StringUtils.isNotBlank(url) && url.toLowerCase().indexOf("login") < 0 && url.toLowerCase().indexOf("validata") < 0) {

            if (null == admin||admin.equals("")) {

                String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";

                response.sendRedirect(localUrl + "AdminController/login/");

                return false;

            }else{
                return true;

            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
