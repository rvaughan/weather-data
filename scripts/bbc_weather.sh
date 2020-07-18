#!/usr/bin/env bash

git pull

cd ..
mkdir -p cardiff/bbc && cd cardiff/bbc
wget -q -O 3_day_forecast.rss "https://weather-broker-cdn.api.bbci.co.uk/en/forecast/rss/3day/2653822"
wget -q -O observations.rss "https://weather-broker-cdn.api.bbci.co.uk/en/observation/rss/2653822"

git commit -m 'Latest BBC Weather data' 3_day_forecast.rss observations.rss
git push
