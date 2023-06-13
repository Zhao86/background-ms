package com.hzlx.service.impl;


import com.hzlx.component.BgmsConfig;
import com.hzlx.service.EasyCaptchaService;
import com.hzlx.utils.BaseResult;
import com.wf.captcha.ArithmeticCaptcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EasyCaptchaServiceImpl implements EasyCaptchaService {
    @Override
    public void captcha(HttpServletRequest request, HttpServletResponse response) {
        ArithmeticCaptcha captcha = new ArithmeticCaptcha(130, 48);
        captcha.setLen(3);  // 几位数运算，默认是两位
        captcha.getArithmeticString();  // 获取运算的公式：3+2=?
        captcha.text();  // 获取运算的结果：5
        request.getSession().setAttribute(BgmsConfig.CAPTCHA_CODE,captcha.text().toLowerCase());
        try {
            captcha.out(response.getOutputStream()) ;  // 输出验证码
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String check(HttpServletRequest request) {
        //获取用户提交过来的 验证码
        String code = request.getParameter("code");
        //session作用域中的验证码
        String captcha = (String) request.getSession().getAttribute(BgmsConfig.CAPTCHA_CODE);
        //session作用域中的code和用户提交过来的code 如果相等 就验证通过 反正验证失败
        if (captcha.equals(code)) {
            return BaseResult.success();
        }else {
            return BaseResult.error(10003,"验证码错误");
        }
    }
}
