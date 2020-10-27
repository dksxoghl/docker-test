FROM postgres:9.3

ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB taehi

WORKDIR /etc/postgresql/9.3/main
RUN sed -i "s/#listen_addresses='localhost'/listen_addresses='*'/g" postgresql.conf
RUN echo "host all all 0.0.0.0/0 password" >> pg_hba.conf

EXPOSE 5432

COPY ./script/ /docker-entrypoint-initdb.d/