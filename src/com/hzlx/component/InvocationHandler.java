package com.hzlx.component;

import java.lang.reflect.Method;

//封装成Handler
public class InvocationHandler {
    //比如找到了UserController下的info，那么代表UserController实例对象，反射调用info方法

    private Object classObject;

    //info方法
    private Method method;
    public InvocationHandler(Object classObject,Method method){
        this.classObject=classObject;
        this.method=method;
    }
    public Object getClassObject(){return classObject;}

    public void setClassObject(Object classObject){this.classObject=classObject;}

    public Method getMethod(){return method;}

    public void setMethod(Method method){this.method=method;}
}
