package com.proxym.apigateway;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class ResourcesController {

    @GetMapping
    public String getMap() {
        return "Resource !";
    }
}
