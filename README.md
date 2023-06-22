# BusApi

# This in an experimenatl API written in [Elixir](https://elixir-lang.org/) using [Ash framework](https://ash-hq.org/)

This api is powered by [Ash JSON:API](https://ash-hq.org/docs/guides/ash_json_api/latest/tutorials/getting-started-with-json-api) along with [elixir-plug](https://github.com/elixir-plug/plug) as the webserver. 

## Installation

Run the following commands:
1. `mix deps.get` to download all the dependencies
2. `mix ash_postgres.create` to create the database. please cheeck the `config/dev.exs` to correct username and password is set.
3. `mix ash_postgres.generate_migrations --name init` to create the necessary databse migration files
4. `mix ash_postgres.migrate` to run the database migration
5. `iex -S mix` to start the apploication in interactive mode

This API has 6 resources i.e. `geo`, `locations`, `route`, `seat`, `trip` and `vehicle`. to learn more about resources and ash framework philosophy, please refer to the [docs](https://ash-hq.org/).
To view all the routes that are avialable for a given resource, run this in your iex session 
```
BusApi.Booking.Resources.GeoPoint
|> AshJsonApi.Resource.Info.routes()
```
Your can do the same for any other resource. To test if the api is working run http request using any client of your choice.
```
curl -X POST 'localhost:4000/geo' \
    --header 'Accept: application/vnd.api+json' \
    --header 'Content-Type: application/vnd.api+json' \
    --data-raw '{
      "data": {
        "type": "geo",
        "attributes": {
          "name": "Newyork",
	  "lat": 200202,
	  "lon": 1161616
        }
      }
    }'
```
To view the created data
```
curl -X GET 'localhost:4000/geo' \
    --header 'Accept: application/vnd.api+json' \
    --header 'Content-Type: application/vnd.api+json'
```
To learn more about JSON:API specification refer to the following [docs](https://jsonapi.org/)
