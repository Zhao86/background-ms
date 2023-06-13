package com.hzlx.Dao.impl;

import com.hzlx.Dao.UserInfoDao;
import com.hzlx.entity.UserInfo;
import com.hzlx.utils.BaseDao;

public class UserInfoDaoImpl extends BaseDao<UserInfo> implements UserInfoDao {

    @Override
    public UserInfo getUserInfoByUserNameAndPassword(String userName, String password) {
        String sql = "select * from userinfo where user_name=? and `password`=?";
        return selectOne(sql,UserInfo.class,userName,password);
    }
}
