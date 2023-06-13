package com.hzlx.annotation;

/**
 * @description 功能描述
 * @Author: Mr、哈喽沃德
 * @Date: 2023/5/31 17:39
 * This file was created in IntelliJ IDEA
 */

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
//注解的生效范围：只能应用在方法上面
@Target(ElementType.METHOD)
public @interface RequestParameter{}