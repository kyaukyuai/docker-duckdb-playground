-- create a table
CREATE TABLE ducks AS SELECT 3 AS age, 'mandarin' AS breed;
-- display tables
SHOW tables;
-- select * from ducks
FROM ducks;
-- show databases
SHOW databases;
-- read data from csv duckdb
SELECT * FROM read_csv_auto('./data/netflix_daily_top_10.csv') limit 3;
SHOW tables;
-- create a table from csv and infer schema
CREATE TABLE netflix_daily_top_10 AS FROM read_csv_auto('./data/netflix_daily_top_10.csv');
-- export to csv
COPY netflix_daily_top_10 TO './generated/output.csv' (HEADER, DELIMITER ',');
-- export to parquet
COPY netflix_daily_top_10 TO './generated/output.parquet' (FORMAT PARQUET);
-- Changing display of data and ouput mode
.mode
-- useful when dealing with JSON for instance
.mode line
FROM netflix_daily_top_10;
SELECT * FROM './data/sales.json';
-- output result to a markdown file
.mode markdown
.output ./generated/myfile.md
FROM netflix_daily_top_10;
-- view extensions
SELECT * FROM duckdb_extensions();
-- Install extension
INSTALL httpfs;
-- Load extension
LOAD httpfs;
-- attach a database when duckdb is running
.open './data/myawesomedb.db' AS myawesomedb;
-- Using the CLI to run a command and exit the process
.quit
duckdb -c "SELECT * FROM read_parquet('./data/netflix_daily_top_10.parquet');"
