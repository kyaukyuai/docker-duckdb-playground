-- Install httpfs extensions
INSTALL httpfs;
LOAD httpfs;
FROM duckdb_extensions()
SELECT loaded, installed, install_path WHERE extension_name = 'httpfs';
-- read a JSON file from the web
SELECT * FROM read_json('https://jsonplaceholder.typicode.com/todos', auto_detect=true);
-- read_json with custom options
SELECT *
FROM read_json('https://jsonplaceholder.typicode.com/todos',
               format='array',
               columns={userId: 'UBIGINT',
               id: 'UBIGINT',
               title: 'VARCHAR',
               completed: 'BOOLEAN'});
-- write the result of a query to a JSON file
COPY (SELECT * FROM read_json('https://jsonplaceholder.typicode.com/todos', auto_detect=true)) TO 'todos.json';
-- read a JSON file from disk
FROM 'todos.json'
-- json_extract function
SELECT json_extract('{"duck": [1, 2, 3]}', '/duck/0');
SELECT json_extract('{"duck": [1, 2, 3]}', '$.duck[0]');
SELECT json_extract('{"duck": [1, 2, 3]}', '$.duck[#-1]');
SELECT json_extract('{"duck.goose": [1, 2, 3]}', '$."duck.goose"[1]');
