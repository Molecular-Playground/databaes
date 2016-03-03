# databæs<3

All installation is done automatically through docker. If you do not have docker installed, install [here](https://docs.docker.com/engine/installation/).

### To Run (Development)
The easiest way to run for production is to use the docker-compose file that can be found [here](https://github.com/Molecular-Playground/molecular-playground). It is possible however to run the container manually. From inside docker virtual machine, navigate to the top directory of this repository. Enter the following commands:
```
docker build -t postgres .
docker run -d --name postgres -e POSTGRES_PASSWORD=dankmemes -v postgres-data:/var/lib/postgresql/data postgres
# where postgres-data is the name of your data volume (more info below)
```

This will run your container 'detached'. To kill the container, type in ```docker kill postgres```.

### Volumes
To persist your data we suggest using a volume. If you already have used the docker-compose file, you will have a volume named ```molecularplayground_postgres-data```. If you instead create a volume manually first and name it ```postgres-data```, the docker-compose file will use that volume. Of course you can create your own volume and specify it's name by running:
```
docker volume create --name hello
# where hello is the name of your volume
```

###Insert Test Data
To insert data into a CLEAN database, run the following
```
docker cp insertData.sql postgres:/
docker exec -it postgres /bin/bash
psql -f insertData.sql postgres postgres
```