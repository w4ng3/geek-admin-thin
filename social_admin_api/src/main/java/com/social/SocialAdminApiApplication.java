package com.social;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author w
 */
@SpringBootApplication
public class SocialAdminApiApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SocialAdminApiApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SocialAdminApiApplication.class);
    }

}
