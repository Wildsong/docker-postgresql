# docker-postgresql-server
Base image for docker-arcgis-enterprise
that has postgresql added.

It has only the client libraries installed, it's intended as a base
image for arcgis-server so that it can connect as a client to
postgresql databases.

## Build

```
docker build -t geoceg/postgresql .
```

## Run

Just for testing... you can start an instance and 
use a bash shell to explore.

```
docker run -it --rm geoceg/postgresql bash
```

From the bash prompt you could run the psql
command to test connecting to databases.

```
psql -U postgres -p -h postgresserver.somewhere.com
```


