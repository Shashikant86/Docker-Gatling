# Gatling setup CI and Docker

This is repo running load test with gatling and generate reports. It does following things

 * Get Gatling Setup into your WORKSPACE or local directory

 * Take your config and simulations(scenario class) and runs load tests against it

 * Generate report in HTML. Default gatling

 * We can run it locally or on CI



# Usage

 Pre-requisite is to have JDK(Java) installed as scala being JVM based language.


## Run Gatling Test Locally

 * Download this project

 * Record your load test simulations and put your class in the 'user-files/simulations'. OR You can use the pre-recorded simulation for this demo

 * Running Gatling Test locally

         sh gatling_local.sh

At the end you will see link to HTML report. Open it into browser and enjoy !!

## Run Gatling Test on Jenkins

* Record your load test simulations and put your class in the 'user-files/simulations'. OR You can use the pre-recorded simulation for this demo

* Run `gatling-jenkins.sh` as part of `execute shell` script


## Running Gatling Test Inside Docker Containers

* Running Gatling Test locally

        sh docker_local.sh

This will download docker image and start container.
