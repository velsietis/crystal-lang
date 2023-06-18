FROM crystallang/crystal
COPY main.cr app/
COPY shard.yml app/
WORKDIR /app
RUN shards install
CMD crystal run main.cr