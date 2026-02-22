# shell-script-terminal-application
Terminal application using schell script to manage services using docker compose for development and local end-to-end testing

### Docker compose commands

##### Pull the latest images of docker containers

    docker compose -f docker-compose.yml pull
    
##### Start all non-running docker containers

    docker compose -f docker-compose.yml up --build -d

##### Start specific docker containers

    docker compose -f docker-compose.yml up --build -d postgres-db rabbitmq
    
##### Stop all running docker containers

    docker compose -f docker-compose.yml down -v

##### Stop specific docker containers

    docker compose -f docker-compose.yml down -v mysql-db rabbitmq

##### Restart specific docker containers

    docker compose -f docker-compose.yml restart mysql-db rabbitmq

##### List all containers with status

    docker compose -f docker-compose.yml ps --all

##### List all configured containers

    docker compose -f docker-compose.yml config --services
    
##### Print/follow logs from all containers from the start

    docker compose -f docker-compose.yml logs -t --tail all --follow

##### Print/follow logs from specific containers from the start

    docker compose -f docker-compose.yml logs -t --tail all --follow postgres-db rabbitmq

##### Print/follow new logs from all containers

    docker compose -f docker-compose.yml logs -t --tail all --follow --since 0s

##### Print/follow new logs from specific containers

    docker compose -f docker-compose.yml logs -t --tail all --follow --since 0s postgres-db rabbitmq

##### Print/follow logs from single container

    docker logs -t -f postgres-db

##### Print/follow new logs from specific container

    docker logs -t -f --since 0s postgres-db

##### Remove/cleanup containers and volumes

    docker compose -f docker-compose.yml rm -f -s -v

##### Prune all images

    docker image prune --all --force