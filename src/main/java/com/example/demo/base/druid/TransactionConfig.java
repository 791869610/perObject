//package com.example.demo.base.druid;
//
//import com.alibaba.druid.pool.DruidDataSource;
//import org.mybatis.spring.annotation.MapperScan;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.AutoConfigureAfter;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.jdbc.datasource.DataSourceTransactionManager;
//import org.springframework.transaction.PlatformTransactionManager;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//import org.springframework.transaction.annotation.TransactionManagementConfigurer;
//
///**
// * @program: demo
// * @description: 让 Druid 支持事务才行，让 Druid 支持事务很简单，实现 Spring 的 TransactionManagementConfigurer 接口，
// * 重写该接口下的 annotationDrivenTransactionManager 方法，在这个方法里面给 DruidDataSource 开启事务，同时让这个类在 DruidConfig 被 Spring 加载之后，再去被 Spring 加载即可
// * @author: jiahao
// * @create: 2018-12-12 21:03
// **/
//@Configuration
//@EnableTransactionManagement
//@AutoConfigureAfter({DruidConfig.class})
//@MapperScan(basePackages = {"Mybatis 的 DAO 接口所在的包路径"})
//public class TransactionConfig implements TransactionManagementConfigurer {
//    @Autowired
//    private DruidDataSource mDataSource;
//
//    @Override
//    public PlatformTransactionManager annotationDrivenTransactionManager() {
//        return new DataSourceTransactionManager(mDataSource);
//    }
//}
