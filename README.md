# shell-script-terminal-application
Terminal application using schell script to manage services using docker compose for development and local end-to-end testing

### Docker compose commands

##### Pull the latest images of docker services

    docker compose -f docker-compose.yml pull
    
##### Start docker services

    docker compose -f docker-compose.yml up --build -d
    
##### Stop docker services

    docker compose -f docker-compose.yml down -v
    
##### Print/follow logs from all containers from the start

    docker compose -f docker-compose.yml logs -t --tail all --follow

##### Print/follow logs from specific containers from the start

    docker compose -f docker-compose.yml logs -t --tail all --follow postgres-db

##### Print/follow new logs from all containers

    docker compose -f docker-compose.yml logs -t --tail all --follow --since 0s

##### Print/follow new logs from specific containers

    docker compose -f docker-compose.yml logs -t --tail all --follow --since 0s postgres-db

#### Print/follow logs from single container

    docker logs -t -f postgres-db

#### Print/follow new logs from specific container

    docker logs -t -f --since 0s postgres-db