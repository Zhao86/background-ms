package com.hzlx.servlet;

import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.lang.ClassScanner;
import com.hzlx.annotation.Controller;
import com.hzlx.annotation.RequestMapping;
import com.hzlx.annotation.ResponseBody;
import com.hzlx.component.HandlerMapping;
import com.hzlx.component.InvocationHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "dispatcherServlet", urlPatterns = "/api/*",loadOnStartup=1)
@RequestMapping("/")
public class DispatcherServlet extends HttpServlet {
    //定义一个静态变量
    private static Map<String, InvocationHandler> handlerMap;

    //tomacat 容器初始化会执行此方法
    @Override
    public void init() throws ServletException{
        HandlerMapping handlerMapping = new HandlerMapping();;
        //扫描controller包
        String controllerUrl = "com.hzlx.controller";
        //hutool 工具类方法：扫描指定包下，包含指定注解的类
        Set<Class<?>> set = ClassScanner.scanPackageByAnnotation(controllerUrl, Controller.class);
        System.out.println("扫描到有controller注解的类："+set);
        //初始化映射关系
        handlerMap = handlerMapping.urlMapping(set);
    }

    //所有请求都会执行这个方法，上面设定了@WebServlet(urlPatterns="/")
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 以请求http：//localhost:8080/user/info为例子
        //获取URL:/user/info
        String uri = req.getRequestURI();
        //获取项目路径："" 可以设定
        String contextPath = req.getContextPath();
        System.out.println(contextPath);
        //判断是否设定了项目路径，有的话就会影响获取handler,所以要排除掉
        if(uri.contains(contextPath)){
            //比如设定了项目路径/project,那么请求变成了/project/user/info
            //映射关系里是不带项目路径的，所以要排除掉变回/user/info
            uri = uri.replace(contextPath,"");
        }


        //根据请求路径获取handler:没有找到，下面会抛出异常
        InvocationHandler invocationHandler = handlerMap.get(uri);
        try{
            //获取真正要执行的方法
            Method method = invocationHandler.getMethod();
            //方法所在的类的实例
            Object classObject = invocationHandler.getClassObject();
            String result = "";
           /* if(AnnotationUtil.hasAnnotation(method, RequestParameter.class)){
                result = (String) method.invoke(classObject,req);
            }else if (AnnotationUtil.hasAnnotation(method, com.hzlx.annotation.HttpServlet.class)){
               method.invoke(classObject,req,resp);
               return;
            }else {
                //执行方法，假设返回String
                result = (String) method.invoke(classObject);
            }*/
            //方便使用  所有controller方法 都默认传两个参数  request  response
            result= (String)method.invoke(classObject,req,resp);
            //需要判断是否带@ResponseBody注解，带了是返回JSON字符串
            if(AnnotationUtil.hasAnnotation(method, ResponseBody.class)){
                  resp.setContentType("text/html;charset=UTF-8");
//                resp.getOutputStream().print(result);
                resp.getWriter().write(result);
                return;
            }
            //没有带@ResponseBody注解代表以跳转视图的形式
            String prefix="";
            String suffix="";
            //判断是否是请求转发
            if(result.contains("forward")){
                req.getRequestDispatcher("/"+prefix+result.replace("forward","")+suffix).forward(req,resp);
            }
            //判断是否重定向
            if (result.contains("redirct:")){
                resp.sendRedirect("http://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/"+prefix+result.replace("redirect",""));
            }
            //如果没有带上述两个，默认请求转发
            if (!result.contains("forward:")&&!result.contains("redirect:")){
                req.getRequestDispatcher("/"+prefix+result+suffix+".jsp").forward(req,resp);
            }
            //没有找到映射关系，也就是会报404，这里直接抛出ServletException异常
        }catch (Exception e){
            throw new ServletException("没有找到资源");
        }
    }
}


