failover:
	docker-compose -f ./failover.docker-compose.yml up -d -V --force-recreate envoy
	@printf -- 'Open a new terminal and paste in the following code:\n\n'
	@printf -- '  while :; do curl localhost:20003; sleep 1; done;\n\n'
	@printf -- "- observe that the response message is \"Hello, I'm three\".\n\n"
	@printf -- 'Open another terminal and shut down egoserver3:\n\n'
	@printf -- '  docker-compose -f ./failover.docker-compose.yml stop egoserver3;\n\n'
	@printf -- "- observe that the curl to localhost:20003 responds with \"Hello, I'm two\".\n\n"

failover.stop:
	docker-compose -f ./failover.docker-compose.yml down