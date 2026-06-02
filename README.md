# Checkout History

This is the repository for the Checkout History app that is attached to [Account](https://github.com/mlibrary/patron_account). 

## To Set up for Development

1. Clone the github repo
```
git clone git@github.com:mlibrary/search.checkout-history.git
cd search.checkout-history
```

run the init script

```
./init.sh
```

edit .env with actual environment variables; ask a developer if you need them


start containers
```
docker compose up -d
```

## Tests
For Rails rspec tests make sure then database is running. Then run the tests:
```bash
$ docker-compose up -d database
$ docker-compose run --rm web bundle exec rspec
```

## Test database
`lib/dev_db/Dockerfile` has instructions for creating an image of the database that's preloaded with fake data. It's intended for use with Account.

## Alma Analytics Report Backups
Backup xml files of the analytics reports are located in `./config/alma_analytics_reports/`
