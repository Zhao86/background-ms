package com.hzlx.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface EasyCaptchaService {
    void captcha(HttpServletRequest request, HttpServletResponse response);
    String check(HttpServletRequest request);
}
