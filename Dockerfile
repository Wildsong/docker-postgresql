From geoceg/ubuntu-server:latest
LABEL maintainer="b.wilson@geo-ceg.org"
ENV REFRESHED_AT 2017-07-13

# I am pinning this at 9.5 because that is the version
# ESRI distributes, and that's the intended use of this image.

RUN apt-get install -y postgresql-9.5 python3-postgresql

# Note the user is still set to root here, we want this so that
# containers that pull from this one still have root when they start.
