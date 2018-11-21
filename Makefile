DOCKERIMGNAME=cypresstestdocker
DOCKERRUNCMD=docker-compose run --rm $(DOCKERIMGNAME)

test-local:
	./node_modules/cypress/bin/cypress run --env configFile=development -s 'cypress/integration/examples/theinternet.spec.js'

test-qa:
	./node_modules/cypress/bin/cypress run --env configFile=qa -s ''cypress/integration/examples/theinternet.spec.js'

test-staging:
	./node_modules/cypress/bin/cypress run --env configFile=staging -s 'cypress/integration/examples/theinternet.spec.js'

test-production:
	./node_modules/cypress/bin/cypress run --env configFile=production -s 'cypress/integration/examples/theinternet.spec.js'

test-unit:
	./node_modules/cypress/bin/cypress run --env configFile=unit -s 'cypress/integration/examples/theinternet.spec.js'

test-unit-gui:
	npx cypress open --env configFile=unit

test-local-gui:
	npx cypress open --env configFile=development

test-qa-gui:
	npx cypress open --env configFile=qa

test-local-record:
	./node_modules/cypress/bin/cypress run --env configFile=development -s 'cypress/integration/examples/theinternet.spec.js' --record --key ${CYPRESS_RECORD_KEY}

test-theinternet:
	./node_modules/cypress/bin/cypress run --env configFile=qa -s 'cypress/integration/examples/theinternet.spec.js'

docker-build:
	docker build -t cypresstestdocker

docker-test-local:
	$(DOCKERRUNCMD) cypress run --env configFile=development -s 'cypress/integration/examples/theinternet.spec.js'

docker-test-qa:
	$(DOCKERRUNCMD) cypress run --env configFile=qa -s ''cypress/integration/examples/theinternet.spec.js'

docker-test-staging:
	$(DOCKERRUNCMD) cypress run --env configFile=staging -s 'cypress/integration/examples/theinternet.spec.js'

docker-test-production:
	$(DOCKERRUNCMD) cypress run --env configFile=production -s 'cypress/integration/examples/theinternet.spec.js'

docker-test-unit:
	$(DOCKERRUNCMD) cypress run --env configFile=unit -s 'cypress/integration/examples/theinternet.spec.js'

docker-test-unit-gui:
	$(DOCKERRUNCMD) npx cypress open --env configFile=unit

docker-test-local-gui:
	$(DOCKERRUNCMD) npx cypress open --env configFile=development

docker-test-qa-gui:
	$(DOCKERRUNCMD) npx cypress open --env configFile=qa

docker-test-local-record:
	$(DOCKERRUNCMD) cypress run --env configFile=development -s 'cypress/integration/examples/theinternet.spec.js' --record --key ${CYPRESS_RECORD_KEY}

docker-test-theinternet:
	$(DOCKERRUNCMD) cypress run --env configFile=qa -s 'cypress/integration/examples/theinternet.spec.js'
