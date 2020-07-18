#!/usr/bin/env bash

git pull

cd ..
mkdir -p cardiff/metoffice && cd cardiff/metoffice
curl --request GET \
    --url 'https://api-metoffice.apiconnect.ibmcloud.com/metoffice/production/v0/forecasts/point/three-hourly?excludeParameterMetadata=false&includeLocationName=true&latitude=51.4816&longitude=3.1791' \
    --header 'accept: application/json' \
    --header 'x-ibm-client-id: dfbb2c5a-5f2a-413d-b676-a88e2a020f44' \
    --header 'x-ibm-client-secret: fV2gW2kA4wD1yQ8lJ6yX7vE6bJ4mJ0hN1fV8gS1uJ3gH5uP5fO' \
    -o weather_new.json
jq . weather_new.json > weather.json
rm weather_new.json

git commit -m 'Latest Met Office Weather data for Cardiff' weather.json
git push
