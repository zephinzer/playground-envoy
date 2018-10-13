basic.external:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_basic_external
	@printf -- 'Google should have become available at http://localhost:20001\n\n'

basic.internal:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_basic_internal
	@printf -- 'Egoserver should have become available at http://localhost:20001\n\n'

failover:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_failover
	@printf -- 'Open a new terminal and paste in the following code:\n\n'
	@printf -- '  while :; do curl localhost:20003; sleep 1; done;\n\n'
	@printf -- "- observe that the response message is \"Hello, I'm three\".\n\n"
	@printf -- 'Open another terminal and shut down egoserver3:\n\n'
	@printf -- '  docker-compose -f ./docker-compose.yml stop egoserver3;\n\n'
	@printf -- "- observe that the curl to localhost:20003 responds with \"Hello, I'm two\".\n\n"

stop:
	docker-compose -f ./docker-compose.yml down