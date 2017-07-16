From geoceg/ubuntu-server:latest
LABEL maintainer="b.wilson@geo-ceg.org"
ENV REFRESHED_AT 2017-07-16

EXPOSE 5432

# I am pinning this at 9.5 because that is the version
# ESRI distributes, and that's the intended use of this image.
#RUN apt-get install -y postgresql-9.5 python3-postgresql

ENV POSTGRES_INSTALLER postgresql-9.5.3-1-linux-x64.run

ADD ${POSTGRES_INSTALLER} ${HOME}
RUN ./${POSTGRES_INSTALLER} --mode unattended \
    --prefix /home/arcgis/postgres \
    --datadir /home/arcgis/postgres/9.5/data \
    --superpassword tumbler123
rm ${POSTGRES_INSTALLER}

# Clues on what I have to do from first run
#WARNING --> PERL_INSTALL_PATH is not set in /home/arcgis/postgres/etc/sysconfig/plLanguages.config file
#WARNING --> PYTHON_INSTALL_PATH is not set in /home/arcgis/postgres/etc/sysconfig/plLanguages.config file
#WARNING --> TCL_INSTALL_PATH is not set in /home/arcgis/postgres/etc/sysconfig/plLanguages.config file
#touch: cannot touch '/var/lock/subsys/postgresql-9.5': No such file or directory

# The fixes
RUN mkdir /var/log/subsys

# Put the Postgres database files in persistent storage
VOLUME [ "${HOME}/postgres/9.5/data" ] 

# Note the user is still set to root here, we want this so that
# containers that pull from this one still have root when they start.

CMD /etc/init.d/postgresql-9.5 start