# Cypress IO 

[![CircleCI](https://circleci.com/gh/YOU54F/cypressio-docker.svg?style=svg)](https://circleci.com/gh/YOU54F/cypressio-docker)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=YOU54F_cypressio-docker&metric=alert_status)](https://sonarcloud.io/dashboard?id=YOU54F_cypressio-docker)

This is an example project testing the https://the-internet.herokuapp.com/

It showcases the use of 
- Switchable environments with different configs
- The Cypress GUI tool
- The Cypress command line tool
- Mochawesome for fancy reporting
- Integration with Cypress' Dashboard Service for project recording
- Docker to self contain the application and require no pre-requisites on the host machine, bar Docker.

## Installation

- Clone the project

### Local Installation
- Run `npm install` in the project 
- View the `Makefile` for available commands

### Docker Installation
- Run `make docker-build` in the project 
- View the `Makefile` for available docker commands

## Dev Dependencies

### Running via docker container
- Docker 

### Running Locally
- node 8+
- npm
- make (otherwise view the Makefile and run commands directly)

## Configuration

The main cypress configuration file, is in the root folder

`cypress.json`

It can contain configuration options applicable to all environments

Environment specific config files are stored in `/cypress/config/<environment.json>`

These will override any configurations specific environment vars set in `cypress.json`

these can be set on the command line by

` --env configFile=<environment.json>`

Currently supported environments are

- development
- production
- staging
- qa

If no option is provided is will default to development

In order to setup development, you will need a website locally running and your URI_ROOT should be set.

`export URI_ROOT=<your_root_url>`

If you are using docker then please set your URI_ROOT in your docker-compose file, it is set in this example

```
        environment:
            - URI_ROOT=http://the-internet.herokuapp.com
```

If it's not set, the application will error, and ask you to set it.

## Running tests in Docker via Make

- `make docker-build` - Build the image
- `make docker-test-local` - Run the tests
- `make docker-bash` - Access the bash shell in the container

For more, see the Makefile

## Running tests locally via Make

- `make test-local` 
- `make test-qa` 
- `make test-staging` 
- `make test-production` 

For more, see the Makefile

## Direct from the command line

The tests can be calling the executable `./node_modules/cypress/bin/cypress`

Provide an env with `--env configFile=<env>` 

And the path for the spec files you wish to run `-s '<pathToFile>'` eg `-s 'cypress/integration/examples/theinternet.spec.js'`

### GUI - Any changes made to test files are automatically picked up by the GUI and executed, post file save.

`make test-local-gui` Opens the GUI with the development configuration selection

`make test-qa-gui` 	Opens the GUI with the qa configuration selection

The GUI can be opened by `npx cypress open` but requires a `--env configFile=<env>` option in order to set the correct BaseURL

### Reporting

Videos of each run are stored in `cypress/videos`

Screenshots of failing tests are stored in `cypress/screenshots`

Reports of test runs are generated with MochaAwesome are stored in `cypress/reports`

## Intellisense

Typings have been added for this project by the Cypress team, use visual studio code - it's free and comes feature packed.

## CircleCI

This project is building in CircleCI and can be viewed at the following link

https://circleci.com/gh/YOU54F/cypressio-docker

See the `.circleci` folder 

- `config.yml` - Contains the CircleCI build configuration
- `sonar-scanner-on-pr.sh` - Contains a script to publish to SonarQube on Pull Requests
- `slack-alert.sh` - Publish Test results to Slack

## Cypress Dashboard Recording

CircleCI builds pass in a `CYPRESS_RECORD_KEY` in order to publish the results to the Cypress Dashboard.

You can view the project here, it is public but will require you sign into Github

https://dashboard.cypress.io/#/projects/ke33f1/runs/35 

## TODO

- CircleCI Workflows
- Check triggering of job from another job
- Loop over screenshots and video folder and programattically build up links for slack
