# Practice

A phoenix api app, with a single endpoint. This app will return, at max 2 (it can return less), users with more than a random number of points.

## Requirements

- Erlang/OTP 24
- Elixir 1.13.0
- PostgreSQL 14.1

## Optional

for PostgreSQL you can use docker-compose provided in repo
```bash
docker-compose up
```

## Installation

Copy .env.example to .env
```bash
cp .env.example .env
```

after tuning required environment variables to your needs run
```bash
source .env
```

get dependencies
```bash
mix deps.get
```

the last step before running application is to setup database and seed users with single command. This step might take a while because it seeds 1 million users, it took less than 5 minutes at my machine
```bash
mix ecto.setup
```

finally we can run our application
```bash
mix phx.server
```

## Tests

you can run unit and integration tests
```bash
mix test
```
