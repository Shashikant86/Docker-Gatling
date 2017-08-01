# Gatling setup CI and Docker

This is repo running load test with gatling locally as well as inside docker containers. It does following things

 * Get Gatling Setup into your Jenkins WORKSPACE or local directory

 * Docker image and contaners with Gatling setup 

 * Generate report in HTML.

 * Easy to use bash scripts plauggable with Jenkins or any othe CI server 



# Usage

 Pre-requisite is to have JDK(Java) installed as scala being JVM based language.


## Run Gatling Test Locally

 * Download/Checkout this project
 
            $ git clone https://github.com/Shashikant86/Docker-Gatling.git
            
 
 * Running Gatling Test locally (Works from Mac) 

         sh gatling_local.sh

This script will download Gatling with version `2.2.5` and unzip the binary and run tests with our simulation. 

At the end you will see link to HTML report. Open it into browser and enjoy !!

 * (Optional) Record your load test simulations and put your class in the 'user-files/simulations'. OR You can use the pre-recorded simulation for this demo as it is 
 
## Running Gatling Test Inside Docker Containers

### Pre-defined Simulation 

* Download the pre-built `Docker-Gatling` image from DockerHub [here](https://hub.docker.com/r/shashikant86/docker-gatling/)

             $ docker pull shashikant86/docker-gatling

*  Run container using the downloaded images 

            $ docker run -it -d --name docker-gatling-container shashikant86/docker-gatling 
            
*  Run default simulations inside the docker containers 

            $ docker exec docker-gatling-container /opt/gatling/bin/gatling.sh -sf /opt/gatling/user-files/simulations/ -s computerdatabase.BasicSimulation -rf /opt/gatling/results/
            
            
This will execute default simulation. 

### Mount your own Simulation 

* Download the pre-built `Docker-Gatling` image from DockerHub [here](https://hub.docker.com/r/shashikant86/docker-gatling/)

             $ docker pull shashikant86/docker-gatling

*  Run container using the downloaded images with mounted simulation 


    `docker run -it -d --rm -v conf:/opt/gatling/conf \
  -v user-files:/opt/gatling/user-files \
  -v results:/opt/gatling/results \
  --name docker-gatling-container shashikant86/docker-gatling
  `

 OR
 
* Running Gatling Test locally using the script 

        sh docker_local.sh

This will download docker image and start container.
 
 
 
## Run Gatling Test on Jenkins

* Record your load test simulations and put your class in the 'user-files/simulations'. OR You can use the pre-recorded simulation for this demo

* Run `gatling-jenkins.sh` as part of `execute shell` script


