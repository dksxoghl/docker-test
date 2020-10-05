package com.taehi.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @RequestMapping("/")
    public String hello() {
        return "Hello, Docker! ㅎㅎㅎ";
    }
}