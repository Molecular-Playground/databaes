FROM postgres:9.5.1

# The postgres image will run any *.sh and *.sql files in the
# /docker-entrypoint-initdb.d initializing postgres database
# automatically.
# See: https://hub.docker.com/_/postgres/
COPY ./db.sql /docker-entrypoint-initdb.d
