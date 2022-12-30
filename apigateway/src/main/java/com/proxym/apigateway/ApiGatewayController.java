package com.proxym.apigateway;

import org.keycloak.KeycloakSecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/")
public class ApiGatewayController {

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/protected")
    public String get() {
        KeycloakSecurityContext attribute = (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());

        return "/protected: "+ attribute.getIdToken().getPreferredUsername();
    }

    @GetMapping("/protected/premium")
    public String premium() {
        KeycloakSecurityContext attribute = (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());

        return "/protected/premium: "+ attribute.getIdToken().getPreferredUsername();
    }

    @GetMapping("/protected/alice")
    public String getAlice() {
        KeycloakSecurityContext attribute = (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());

        return "/protected/alice: " + attribute.getIdToken().getPreferredUsername();
    }

    @GetMapping("/logout")
    public void logout(HttpServletResponse response) throws ServletException, IOException {
        request.logout();
        response.sendRedirect("/");
    }
}
