# databæs<3

All installation is done automatically through docker. If you do not have docker installed, install [here](https://docs.docker.com/engine/installation/).

### To Run using Docker Compose (Recommended)
The easiest way to run for production is to use the docker-compose file that can be found [here](https://github.com/molecular-playground/molecular-playground). It is possible however to run the container manually as detailed in the rest of this document.

### Setup
This microservice uses environment variables to make it easier to deploy at different locations. You will need to create a file named ```molecular-playground.env``` one level above this directory for deployment to work properly. The following environment variables are used in this microservice:

- ```POSTGRES_PASSWORD``` - The password used to connect to the postgres database.

Below is an example of what your ```molecular-playground.env``` should look like using the above environment variables. ```YOUR_VALUE_HERE``` is simply a placeholder for your own value.
```
POSTGRES_PASSWORD=YOUR_VALUE_HERE
```

To make sure everything works correctly, make sure you use the same values for each microservice you are using. This can be easily done by using the same molecular-playground.env file.

### To Run Manually
The easiest way to run for production is to use the docker-compose file that can be found [here](https://github.com/Molecular-Playground/molecular-playground). It is possible however to run the container manually. From inside docker virtual machine, navigate to the top directory of this repository. Enter the following commands:
```
docker build -t postgres .
docker run -d --name postgres --env-file ../molecular-playground.env -v postgres-data:/var/lib/postgresql/data postgres
# where postgres-data is the name of your data volume (more info below)
```

This will run your container 'detached'. To kill the container, type in ```docker kill postgres```.

### Volumes
To persist your data we suggest using a volume. If you already have used the docker-compose file, you will have a volume named ```molecularplayground_postgres-data```. We suggest using that name to continue using the same volume as your docker-compose environment. Don't worry, if you did not use the docker-compose file yet and you would like to use the same volume as that environment you can create the volume and use it simply by using that name in the run command.

Here are some helpful commands for using docker volumes:
```
# list all volumes
docker volume ls

# remove a volume (useful for resetting the database)
docker volume rm name
# where name is the name of the volume you would like to remove
```

### Insert Test Data
To insert data into a CLEAN database, run the following:
```
docker cp insertData.sql postgres:/
docker exec -it postgres /bin/bash
psql -f insertData.sql postgres postgres
```
