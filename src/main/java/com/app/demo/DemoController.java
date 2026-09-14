package com.app.demo;

import java.time.Instant;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @GetMapping("/")
    public Map<String, Object> home() {
        return Map.of(
            "application", "devsecops-demo-app",
            "status", "running",
            "timestamp", Instant.now().toString()
        );
    }
}