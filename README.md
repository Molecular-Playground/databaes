# databæs<3

All installation is done automatically through docker. If you do not have docker installed, install [here](https://docs.docker.com/engine/installation/).

### To Run
From inside docker virtual machine, navigate to the top directory of this repository. Enter the following command:
```
docker run --name postgres -e POSTGRES_PASSWORD=dankmemes -d postgres
```

### Initialize the database for the first time
To initialize the postgres database for the first time, follow the following steps:
```
# copy the init file into the running postgres container
docker cp db.sql postgres:/home

# begin shell inside of the postgres container
docker exec -i -t postgres bash

# navigate to the the init file and initialize the database
$ psql -f /home/db.sql postgres postgres

# exit the postgres container, you are done!
$ exit
```
Note: Every new container will not have the database initialized. Try ```docker start some-postgres``` to start an old container.
