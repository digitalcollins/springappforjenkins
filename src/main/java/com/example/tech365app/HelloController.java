// write helloword api

package com.example.tech365app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/api")
    public String hello() {
        return "welcome to Java";
    }
}