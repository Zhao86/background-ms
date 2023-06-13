package com.hzlx.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author 哈喽沃德
 * @version 1.0.0
 * @title HttpServlet
 * @description <TODO description class purpose>
 * @createTime 2023/6/5 8:53
 **/
@Retention(RetentionPolicy.RUNTIME)
// 注解的生效范围：只能应用在方法上面
@Target(ElementType.METHOD)
public @interface HttpServlet {
}
