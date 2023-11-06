FROM debian:bookworm

ARG DUCKDB_VERSION

RUN apt-get update && apt-get install -y \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/duckdb/duckdb/releases/download/v${DUCKDB_VERSION}/duckdb_cli-linux-aarch64.zip \
    && unzip duckdb_cli-linux-aarch64.zip -d /usr/local/bin \
    && rm duckdb_cli-linux-aarch64.zip

COPY data /data
COPY generated /generated
COPY sql /sql

COPY .duckdbrc /root/

CMD ["duckdb", "--version"]
