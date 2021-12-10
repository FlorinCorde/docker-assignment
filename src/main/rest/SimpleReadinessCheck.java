package com.y.dockerassignment.rest;
@Readiness
@ApplicationScoped
public class SimpleReadinessCheck implements HealthCheck {

    @Override
    public HealthCheckResponse call() {
        return HealthCheckResponse.named("simple-readiness-check").up().build();
    }
}
