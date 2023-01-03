package com.proxym.apigateway;

import org.keycloak.KeycloakSecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/")
@Profile("v2")
public class ApiGatewayControllerv2 {

    @Autowired
    private HttpServletRequest request;

    @GetMapping
    public String defRoute() {
        System.out.println("*** Headers ***");

        for(String headerName : Collections.list(request.getHeaderNames())) {
            System.out.println("Header " + headerName + " : " +request.getHeader(headerName));
        }

        return "V2 !";
    }
}
