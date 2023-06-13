package com.hzlx.controller;

import com.hzlx.annotation.Controller;
import com.hzlx.annotation.RequestMapping;
import com.hzlx.annotation.ResponseBody;
import com.hzlx.service.UserInfoService;
import com.hzlx.service.impl.UserInfoServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/api/user")
public class UserInfoController {
    private UserInfoService userInfoService = new UserInfoServiceImpl();
    @RequestMapping("/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response) {

        return userInfoService.login(request,response);

    }

}
