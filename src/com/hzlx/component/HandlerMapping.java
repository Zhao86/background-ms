package com.hzlx.component;

import cn.hutool.core.annotation.AnnotationUtil;
import com.hzlx.annotation.RequestMapping;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class HandlerMapping {

    //方法作用：获取路径映射的Map，可以根据请求路径，找到对应的Handler，找到后就可以反射执行方法
    //参数：所有带有@Controller的类的Class对象
    public Map<String,InvocationHandler> urlMapping(Set<Class<?>> classSet){

        //key：请求路径，如/user/info  value：Handler对象，因为要根据路径找到具体的handler对象
        HashMap<String, InvocationHandler> handlerHashMap = new HashMap<>();

        //遍历所有Class对象，为了查询该类的方法哪些有@RequestMapping
        for(Class<?> aClass:classSet){
            //hutool工具类方法：获取该Class对象上的@RequestMapping的value值，没有返回null
            String classReqPath = AnnotationUtil.getAnnotationValue(aClass, RequestMapping.class);
            System.out.println(aClass.getName()+"类的请求路径:" + classReqPath);
            //反射获取该类所有方法
            Method[] methods = aClass.getDeclaredMethods();
            if(methods!=null && methods.length>0){
                //遍历所有方法
                for(Method method : methods){
                    //查看方法上面有没有@RequestMapping
                    boolean flag = AnnotationUtil.hasAnnotation(method, RequestMapping.class);
                    if(flag){
                        //有注解：获取注解的值，也就是请求路径
                        String methodReqPath = AnnotationUtil.getAnnotationValue(method, RequestMapping.class);
                        if(StringUtils.isEmpty(methodReqPath)){
                            //value没有值则返回""
                            methodReqPath="";
                        }
                        System.out.println(aClass.getName()+":"+method.getName()+"方法上的请求路径:" + methodReqPath);
                        try {
                            //类上的@RequestMapping的value为空，返回""
                            if(StringUtils.isEmpty(classReqPath)){
                                classReqPath="";
                            }
                            // 将得到的值封装成 InvocationHandler 对象
                            //放入一个当前类的实例对象，用于执行后面的类方法
                            InvocationHandler invocationHandler = new InvocationHandler(aClass.newInstance(), method);
                            // 使用 类的请求路径 + 方法的请求路径 作为Key
                            handlerHashMap.put(classReqPath + methodReqPath, invocationHandler);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return handlerHashMap;
    }
}
