package com.proxym.apigateway;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class ResourcesController {

    @GetMapping
    public String getMap() {
        return "Resource !";
    }

    @GetMapping("action")
    public String getMap(HttpServletRequest request, @RequestParam("token") String token) {
        return "Resource !";
    }
}
