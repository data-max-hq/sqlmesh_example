# Setup guide

## DuckDB CLI

**Install duckdb CLI (on MacOS)**
```bash
brew install duckdb
```

**Install duckdb CLI (on Windows)**
```bash
winget install DuckDB.cli
```

## Python environment

I've used for this project python version 3.12

**Setup project with pip**
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install "sqlmesh[llm,postgres,web]"
```

**Setup project with uv**
```bash
uv venv -p python3.12
source .venv/bin/activate
uv sync
```

## postgres as state database (optional)

If you want to try out postgres as a dedicated state database for SQLMesh, you can use the compose.yml to start a docker 
container for postgres and one for adminer (http://localhost:8080) to connect via web ui with the instance.  

If you don't want to use this setup, you can simply remove the `state_connection` from the `config.yaml.  
```diff
gateways:
  local:
    connection:
      type: duckdb
      database: sqlmesh.db
-   state_connection:
-     type: postgres
-     host: localhost
-     port: 5432
-     user: sqlmesh
-     password: sqlmesh
-     database: sqlmesh
```
SQLMesh will then implicitly use the connection as the state store.

**Install docker desktop (on MacOS)**
```bash
brew install --cask docker
```

**Install docker desktop (on Windows)**
Please follow the guide on https://docs.docker.com/desktop/setup/install/windows-install/

**Start postgres and adminer container in background**
```bash
docker compose up -d
```

# development workflow

```bash
sqlmesh plan
```

## DuckDB as storage database

Query tables with duckdb CLI:
```bash
duckdb sqlmesh.db "SELECT * FROM imdb.netflix"
duckdb sqlmesh.db "SELECT * FROM imdb.trends_by_year"
duckdb sqlmesh.db "SELECT * FROM imdb.trends_by_country"
```

Made with ❤️ by [datamax.ai](https://www.datamax.ai/).
