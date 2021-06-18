FROM postgres:12.4

RUN apt-get update \
    && apt-get install wget -y \
    && apt-get install postgresql-12-postgis-3 -y \
    && apt-get install postgis -y

# Variables needed at runtime to configure postgres and run the initdb scripts
ENV POSTGRES_DB ''
ENV POSTGRES_USER ''
ENV POSTGRES_PASSWORD ''

# Copy in the load-extensions script
# COPY dockerfiles/load-extensions.sh /docker-entrypoint-initdb.d/
COPY dockerfiles/db.sql /docker-entrypoint-initdb.d/