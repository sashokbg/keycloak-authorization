package com.proxym.apigateway;

import org.keycloak.adapters.KeycloakConfigResolver;
import org.keycloak.adapters.KeycloakDeployment;
import org.keycloak.adapters.KeycloakDeploymentBuilder;
import org.keycloak.adapters.spi.HttpFacade;
import org.keycloak.adapters.springsecurity.KeycloakConfiguration;
import org.keycloak.adapters.springsecurity.config.KeycloakWebSecurityConfigurerAdapter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import java.io.InputStream;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class ApigatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApigatewayApplication.class, args);
	}

	//@Bean
	//public KeycloakConfigResolver KeycloakConfigResolver() {
	//	return new KeycloakSpringBootConfigResolver();
	//}

	@Bean
	public KeycloakConfigResolver keycloakConfigResolver() {
		return new KeycloakConfigResolver() {

			private KeycloakDeployment keycloakDeployment;

			@Override
			public KeycloakDeployment resolve(HttpFacade.Request facade) {
				if (keycloakDeployment != null) {
					return keycloakDeployment;
				}

				String path = "/keycloak.json";
				InputStream configInputStream = getClass().getResourceAsStream(path);

				if (configInputStream == null) {
					throw new RuntimeException("Could not load Keycloak deployment info: " + path);
				} else {
					keycloakDeployment = KeycloakDeploymentBuilder.build(configInputStream);
				}

				return keycloakDeployment;
			}
		};
	}
}
