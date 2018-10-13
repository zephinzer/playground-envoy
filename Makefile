PATH_DOCKERCOMPOSE=./docker-compose.yml

basic.external:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_basic_external
	$(MAKE) utils.linebreak
	@printf -- 'Google should have become available at http://localhost:20001\n\n'

basic.internal:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_basic_internal
	$(MAKE) utils.linebreak
	@printf -- 'Egoserver should have become available at http://localhost:20001\n\n'

failover:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_failover
	$(MAKE) utils.linebreak
	@printf -- 'Open a new terminal and paste in the following code:\n\n'
	@printf -- '  while :; do curl localhost:20003; sleep 1; done;\n\n'
	@printf -- "- observe that the response message is \"Hello, I'm three\".\n\n"
	@printf -- 'Open another terminal and shut down egoserver3:\n\n'
	@printf -- '  docker-compose -f ./docker-compose.yml stop egoserver3;\n\n'
	@printf -- "- observe that the curl to localhost:20003 responds with \"Hello, I'm two\".\n\n"

headers:
	docker-compose -f ./docker-compose.yml up -d -V --force-recreate envoy_headers
	@$(MAKE) utils.linebreak
	@printf -- 'Open a new terminal and paste in the following code:\n\n'
	@printf -- '  while :; do A1=\"$$(curl -s localhost:20001)\" && A2=\"$$(curl -s localhost:20002)\" && diff <(echo \"$${A1}\") <(echo \"$${A2}\"); sleep 1; done;'

stop:
	docker-compose -f ./docker-compose.yml down

# --------------------
# admin recipes follow
# --------------------

admin.logs:
	docker logs -f $(shell docker-compose ps | grep envoy_svc | cut -f 1 -d ' ')

admin.reload:
	docker-compose -f $(PATH_DOCKERCOMPOSE) restart $(shell docker-compose ps | grep envoy_svc | cut -f 1 -d ' ' | sed 's|_svc||g')

utils.linebreak:
	@printf -- '\n\033[1m Envoy Playground Instructions Follow\n'
	@printf -- ' ------------------------------------\033[0m\n\n'