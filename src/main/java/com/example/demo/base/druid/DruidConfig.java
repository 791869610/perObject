//package com.example.demo.base.druid;
//
//import com.alibaba.druid.pool.DruidDataSource;
//import com.alibaba.druid.support.http.StatViewServlet;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.boot.web.servlet.ServletRegistrationBean;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Primary;
//import org.springframework.stereotype.Component;
//
//import java.sql.SQLException;
//
///**
// * @program: demo
// * @description: druid配置类
// * @author: jiahao
// * @create: 2018-12-12 20:58
// **/
//@Data
//@Component
//@ConfigurationProperties(prefix = "spring.datasource.druid")
//public class DruidConfig {
//    private final Logger logger = LoggerFactory.getLogger(DruidConfig.class);
//
//    private String driverClassName;
//    private String url;
//    private String username;
//    private String password;
//    private int initialSize;
//    private int minIdle;
//    private int maxActive;
//    private long maxWait;
//    private long timeBetweenEvictionRunsMillis;
//    private long minEvictableIdleTimeMillis;
//    private String validationQuery;
//    private boolean testWhileIdle;
//    private boolean testOnBorrow;
//    private boolean testOnReturn;
//    private boolean poolPreparedStatements;
//    private int maxPoolPreparedStatementPerConnectionSize;
////    private long removeAbandonedTimeoutMillis;
////    private boolean removeAbandoned;
////    private boolean logAbandoned;
////    private boolean logDifferentThread;
//    private String filters;
//    private String connectionProperties;
////    private boolean useGlobalDataSourceStat;
//
////    //Druid 监控 Servlet 配置参数
////    private String druidRegistrationUrl;
////    private boolean resetEnable;
////    private String loginUsername;
////    private String loginPassword;
////
////    // Filters 配置参数
////    private String filtersUrlPatterns;
////    private String exclusions;
////    private int sessionStatMaxCount;
////    private boolean sessionStatEnable;
////    private String principalSessionName;
////    private boolean profileEnable;
//
//    @Bean(initMethod = "init", destroyMethod = "close")
//    @Primary
//    public DruidDataSource dataSource() {
//        logger.info("进入dataSource配置");
//        DruidDataSource dataSource = new DruidDataSource();
//        logger.info("driverClassName"+driverClassName);
//        logger.info("url"+url);
//        logger.info("username"+username);
//        logger.info("password"+password);
//        dataSource.setDriverClassName(driverClassName);
//        dataSource.setUrl(url);
//        dataSource.setUsername(username);
//        dataSource.setPassword(password);
//        dataSource.setInitialSize(initialSize);
//        dataSource.setMinIdle(minIdle);
//        dataSource.setMaxActive(maxActive);
//        dataSource.setMaxWait(maxWait);
//        dataSource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
//        dataSource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
//        dataSource.setValidationQuery(validationQuery);
//        dataSource.setTestWhileIdle(testWhileIdle);
//        dataSource.setTestOnBorrow(testOnBorrow);
//        dataSource.setTestOnReturn(testOnReturn);
//        dataSource.setPoolPreparedStatements(poolPreparedStatements);
//        dataSource.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
////        dataSource.setRemoveAbandonedTimeoutMillis(removeAbandonedTimeoutMillis);
////        dataSource.setRemoveAbandoned(removeAbandoned);
////        dataSource.setLogDifferentThread(logDifferentThread);
//
//        try {
//            dataSource.setFilters(filters);
//        }
//        catch(SQLException e) {
//            e.printStackTrace();
//            logger.error("Druid URL过滤设置失败", e);
//        }
//        dataSource.setConnectionProperties(connectionProperties);
////        dataSource.setUseGlobalDataSourceStat(useGlobalDataSourceStat);
//
//        return dataSource;
//    }
//
////    @Bean
////    public ServletRegistrationBean druidServlet() {
////        ServletRegistrationBean servletBean = new ServletRegistrationBean(new StatViewServlet(), druidRegistrationUrl);
////        servletBean.addInitParameter("resetEnable", String.valueOf(resetEnable));
////        servletBean.addInitParameter("loginUsername", loginUsername);
////        servletBean.addInitParameter("loginPassword", loginPassword);
////
////        return servletBean;
////    }
//}
