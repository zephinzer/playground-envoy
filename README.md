# Envoy Playground
A repository for testing out the behaviour of the Envoy proxy.

# Requirements
You will need `make`, `docker` and `docker-compose` to run examples in this project.

# Examples
The following examples have been completed and ready to use.

- [Basic External](#basic-external)
- [Endpoint Failover](#endpoint-failover)

For all examples, run `make stop` to stop it before spinning up another example.

## Basic External
This example demonstrates how to use Envoy as a proxy.

To run this, use `make basic.external` and visit http://localhost:20001.

You should see Google.

## Basic Internal
This example demonstrates how to use Envoy as a proxy.

To run this, use `make basic.internal` and visit http://localhost:20001.

You should see a JSON response by the Egoserver.

## Endpoint Failover
This example demonstrates the ability to specify a failover endpoint.

To run this, use `make failover` and follow the console printed instructions.
