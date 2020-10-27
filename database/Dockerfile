FROM postgres:9.3

ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB taehi

## Copy postgres config file into container
#COPY postgresql.conf /etc/postgresql
#
## Override default postgres config file
#CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]

WORKDIR /etc/postgresql/9.3/main
#RUN sed -i "s/#listen_addresses='localhost'/listen_addresses='*'/g" postgresql.conf
#RUN echo "host all all 0.0.0.0/0 password" >> pg_hba.conf

RUN sed -i -e"s/^#listen_addresses =.*$/listen_addresses = '*'/"  postgresql.conf
RUN echo "host    all    all    0.0.0.0/0    md5" >> /var/lib/postgresql/data/pg_hba.conf


EXPOSE 5432

COPY ./script/ /docker-entrypoint-initdb.d/