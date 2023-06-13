package com.hzlx.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserInfoService {
    /**
     * 用户登陆方法请求
     * @param request http请求 用于获取用户提交的数据
     * @param response http响应 给用户返回数据
     * @return jaon字符串
     */
    String login(HttpServletRequest request, HttpServletResponse response);

}
