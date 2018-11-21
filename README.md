# Cypress IO

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
- unit (sets a blank url as testing components, not a built site)

If no option is provided is will default to development

In order to setup development, you will need a website locally running and your URI_ROOT should be set.

`export URI_ROOT=<your_root_url>`

If you are using docker then please set your URI_ROOT in your docker-compose file, it is set in this example

```
        environment:
            - URI_ROOT=the-internet.herokuapp.com
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

`make test-unit-gui`  Opens the GUI with the unit test configuration selection

`make test-local-gui` Opens the GUI with the development configuration selection

`make test-qa-gui` 	Opens the GUI with the qa configuration selection

The GUI can be opened by `npx cypress open` but requires a `--env configFile=<env>` option in order to set the correct BaseURL

### Reporting

Videos of each run are stored in `cypress/videos`

Screenshots of failing tests are stored in `cypress/screenshots`

Reports of test runs are generated with MochaAwesome are stored in `cypress/reports`

## Intellisense

Typings have been added for this project by the Cypress team, use visual studio code - it's free and comes feature packed.

## TODO

- Add vnc to docker build so we can view the GUI in the container
- Need to check hot reloading works inside the docker container for the test GUI
- pare back base image as I think it can be smaller
