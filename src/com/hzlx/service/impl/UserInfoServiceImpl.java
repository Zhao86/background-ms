package com.hzlx.service.impl;

import com.hzlx.Dao.UserInfoDao;
import com.hzlx.Dao.impl.UserInfoDaoImpl;
import com.hzlx.entity.UserInfo;
import com.hzlx.service.UserInfoService;
import com.hzlx.utils.BaseResult;
import com.hzlx.utils.MD5EncryptionUtil;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInfoServiceImpl implements UserInfoService {
    //引入dao层 用于查询数据库
    private UserInfoDao userInfoDao = new UserInfoDaoImpl();

    @Override
    public String login(HttpServletRequest request,HttpServletResponse  response){
        //从请求中获取用户名和密码
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        //做非空校验
        if (StringUtils.isEmpty(userName)||StringUtils.isEmpty(password)){
            return BaseResult.error(10001,"用户名或者密码为空");
        }

        //给密码加密
        String encryptMD5 = MD5EncryptionUtil.encryptMD5(password, userName);

        //拿加密后的密码和用户名去数据库里查询数据信息
        UserInfo userInfo = userInfoDao.getUserInfoByUserNameAndPassword(userName, encryptMD5);

        //如果查询到的userInfo为空 则说明用户不存在 判定账号或者密码错误
        if (userInfo==null){
            return BaseResult.error(10002,"账号或者用户名错误");
        }
        //用户登录成功之后 把用户信息存入session中方便后续使用
        request.getSession().setAttribute(userName,password);
        return BaseResult.success();


    }
}
