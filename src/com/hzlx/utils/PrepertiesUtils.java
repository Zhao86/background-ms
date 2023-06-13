package com.hzlx.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

//读取Preperties配置文件
public class PrepertiesUtils {
    private static Properties properties ;

    private PrepertiesUtils(){

    }


    static {
        properties = new Properties();
    }
    /**
     * 把配置文件读取到程序里
     * fileName：配置文件的名字
     * */
    public static void load(String fileName) {

        //把配置文件转成一个输入流
        InputStream resourceAsStream = PrepertiesUtils.class.getClassLoader().getResourceAsStream(fileName + ".properties");
        try {
            properties.load(resourceAsStream);
        } catch (IOException e) {
            System.out.println("加载配置文件异常");
            e.printStackTrace();
        }
    }
    /**
     * 根据配置文件中的key
     * */
    public static String getValue(String key){
        return properties.get(key).toString();
    }
}
