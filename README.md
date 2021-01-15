# dSIPRouter Docker Images
The dSIPRouter Docker images is used to install all the necessary services in containers.

## Prerequisites 
Docker is required in order to run the containers.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

## Installation
The dSIPRouter Docker images can be run using Docker Compose.

### Install dSIPRouter using Docker Compose
Using Docker Compose makes configuring, installing, and upgrading dSIPRouter easy:
1. [Install Docker Compose](https://docs.docker.com/compose/install/)
2. Change directory to the dsiprouter docker-compose.yml file.
      
            cd dsiprouter-docker/docker-compose.yml
      
3. Then install dSIProuter using the following command:

            docker-compose up -d
