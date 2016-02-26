FROM postgres:9.4
ARG BUILD_TYPE=release
ENV POSTGRES_PASSWORD=dankmemes

# The postgres image will run any *.sh and *.sql files in the
# /docker-entrypoint-initdb.d initializing  postgres database
# automatically.
# See: https://hub.docker.com/_/postgres/
COPY ./${BUILD_TYPE}.sql /docker-entrypoint-initdb.d