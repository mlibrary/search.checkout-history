# Checkout History

This is the repository for the Checkout History app that is attached to [Account](https://github.com/mlibrary/account). 

## To Set up for Development

Clone the github repo

```bash
git clone git@github.com:mlibrary/search.checkout-history.git
cd search.checkout-history
```

run the init script

```bash
./init.sh
```

edit .env with actual environment variables; ask a developer if you need them

start containers

```bash
docker compose up -d
```

## Tests

For Rails rspec tests make sure then database is running. Then run the tests:

```bash
docker compose run --rm app bundle exec rspec
```

## Alma Analytics Report Backups

Backup xml files of the analytics reports are located in `./config/alma_analytics_reports/`

## Development database

To reset the database in development run:

```bash
$ docker compose run --rm web bundle exec rails db:schema:load
$ docker compose run --rm web bundle exec rails db:seed
```

