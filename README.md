# Personal Training :muscle:

## Configuration database and Installing dependencies

```
cp .env.example .env
```

```
docker-compose up -d
```

```
mix deps.get
```

```
yarn install
```

```
mix ecto.create
```

```
mix ecto.migrate
```

```
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Stack
 - Elixir 1.12
 - Phoenix 1.5.13
 - Postgres 13
 - Docker
 - Docker compose

## Authors

- [brandaoplaster](https://github.com/brandaoplaster)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
