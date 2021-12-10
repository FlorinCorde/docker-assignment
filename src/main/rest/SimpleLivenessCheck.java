package com.y.dockerassignment.rest;

@Liveness
@ApplicationScoped
public class SimpleLivenessCheck implements HealthCheck {

    @Override
    public HealthCheckResponse call() {
        return HealthCheckResponse.named("simple-liveness-check").up().build();
    }
}
