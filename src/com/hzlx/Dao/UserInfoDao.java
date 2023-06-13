package com.hzlx.Dao;

import com.hzlx.entity.UserInfo;

public interface UserInfoDao {
    /**
     * 根据用户名和密码查询用户信息
     *
     * @param userName 用户名
     * @param password 密码
     * @return 用户对象
     */
  UserInfo getUserInfoByUserNameAndPassword(String userName, String password);

}
