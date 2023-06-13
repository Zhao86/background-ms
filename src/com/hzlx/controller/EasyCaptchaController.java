package com.hzlx.controller;

import com.hzlx.annotation.Controller;
import com.hzlx.annotation.RequestMapping;
import com.hzlx.annotation.ResponseBody;
import com.hzlx.service.EasyCaptchaService;
import com.hzlx.service.impl.EasyCaptchaServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/api/captcha")
public class EasyCaptchaController {

    private EasyCaptchaService easyCaptchaService=new EasyCaptchaServiceImpl();
    @RequestMapping("/code")
    public void code(HttpServletRequest request, HttpServletResponse response){
        easyCaptchaService.captcha(request,response);
    }
    @RequestMapping("/check")
    @ResponseBody
    public String checkCaptcha(HttpServletRequest request, HttpServletResponse response){
        return easyCaptchaService.check(request);
    }
}
