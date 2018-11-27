DOCKERIMGNAME=cypresstestdocker
DOCKERRUNCMD=docker-compose run --rm $(DOCKERIMGNAME)
CYPRESSRUNCMD=./node_modules/cypress/bin/cypress run

test-local:
	$(CYPRESSRUNCMD) --env configFile=development -s 'cypress/integration/examples/*.spec.js'

test-qa:
	$(CYPRESSRUNCMD) --env configFile=qa -s 'cypress/integration/examples/*.spec.js'

test-staging:
	$(CYPRESSRUNCMD) --env configFile=staging -s 'cypress/integration/examples/*.spec.js'

test-production:
	$(CYPRESSRUNCMD) --env configFile=production -s 'cypress/integration/examples/*.spec.js'

test-local-gui:
	npx cypress open --env configFile=development

test-qa-gui:
	npx cypress open --env configFile=qa

test-qa-record:
	$(CYPRESSRUNCMD) --env configFile=qa -s 'cypress/integration/examples/*.spec.js' --record

test-*:
	$(CYPRESSRUNCMD) --env configFile=qa -s 'cypress/integration/examples/*.spec.js'

docker-build:
	docker build . -t $(DOCKERIMGNAME)

docker-bash:
	$(DOCKERRUNCMD) /bin/bash

docker-test-local:
	$(DOCKERRUNCMD) $(CYPRESSRUNCMD) --env configFile=development -s 'cypress/integration/examples/*.spec.js'

docker-test-qa:
	$(DOCKERRUNCMD) $(CYPRESSRUNCMD) --env configFile=qa -s 'cypress/integration/examples/*.spec.js'

docker-test-staging:
	$(DOCKERRUNCMD) $(CYPRESSRUNCMD) --env configFile=staging -s 'cypress/integration/examples/*.spec.js'

docker-test-production:
	$(DOCKERRUNCMD) $(CYPRESSRUNCMD) --env configFile=production -s 'cypress/integration/examples/*.spec.js'

docker-test-local-record:
	$(DOCKERRUNCMD) $(CYPRESSRUNCMD) --env configFile=development -s 'cypress/integration/examples/*.spec.js' --record

docker-test-*:
	$(DOCKERRUNCMD) $(CYPRESSRUNCMD) --env configFile=qa -s 'cypress/integration/examples/*.spec.js'
