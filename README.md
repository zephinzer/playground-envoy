# Envoy Playground
A repository for testing out the behaviour of the Envoy proxy.

# Requirements
You will need `make`, `docker` and `docker-compose` to run examples in this project.

# Examples
The following examples have been completed and ready to use.

- [Basic](#basic)
- [Endpoint Failover](#endpoint-failover)

For all examples, run `make stop` to stop it before spinning up another example.

## Basic
This example demonstrates how to use Envoy as a proxy.

To run this, use `make basic` and visit http://localhost:20001.

## Endpoint Failover
This example demonstrates the ability to specify a failover endpoint.

To run this, use `make failover` and follow the instructions.
