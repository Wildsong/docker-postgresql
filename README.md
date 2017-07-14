# docker-postgresql-server
Base image for docker-arcgis-enterprise
that has postgresql added.

It can either be used to build a PostgreSQL server
or you can use this as a base for arcgis-server
to provide it with the PostgreSQL client libraries.

## Build

```
docker build -t geoceg/postgresql-server .
```

## Run

Just for testing... you can start an instance and 
use a bash shell to explore.

```
docker run -it --rm geoceg/postgresql-server bash
```

