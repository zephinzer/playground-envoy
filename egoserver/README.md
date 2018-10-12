# Ego Server

This is an echo server that responds with a message declaring who it is based on the environment variable `NAME`



# Configuration

| Variable Name | Description |
| --- | --- |
| `NAME` | The name which the server will respond with (*"Hello, I'm ...*) |
| `PORT` | The port which the server will listen on |
| `WAIT` | The amount of timeout to simulate before responding - useful for testing failovers based on timeouts |


# Getting Started

## Standalone

Run `docker build -t a .` in this directory and you can run it with `docker run a`.

## Proper Usage

The `docker-compose.yml` file in the root directory will build this automatically, use it instead of running it alone.
