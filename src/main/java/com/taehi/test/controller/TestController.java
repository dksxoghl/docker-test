package com.taehi.test.controller;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;

@RestController
public class TestController extends JdbcDaoSupport {

    public TestController(DataSource dataSource) {
        setDataSource(dataSource);
    }
    @RequestMapping("/")
    public String hello() {
        return getJdbcTemplate().queryForObject("select h_test from hello where h_id=?", String.class, "a");
    }
}