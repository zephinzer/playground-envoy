# Envoy Playground
A repository for testing out the behaviour of the Envoy proxy.

# Requirements
You will need `make`, `docker` and `docker-compose` to run examples in this project.

# Examples
The following examples have been completed and ready to use.

- [Basic External](#basic-external)
- [Basic Internal](#basic-internal)
- [Endpoint Failover](#endpoint-failover)
- [Headers Manipulation](#headers-manipulation)

For all examples, run `make stop` to stop it before spinning up another example.

Some administrative commands as follows:

- `make admin.logs`: outputs the logs in follow mode of the currently running envoy service
- `make admin.reload`: restarts the currently running envoy service to let updated configurations take effect (note that if you changed the volume path, this will not work, this works only for situations where you modified a configuration file's contents)

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

## Headers Manipulation
This example demonstrates how to use Envoy to manipulate headers.

To run this, use `make headers` and follow the console printed instructions.
