#!/usr/bin/env bash

/usr/bin/git pull

cd ..
mkdir -p cardiff/bbc && cd cardiff/bbc
/usr/bin/wget -q -O 3_day_forecast.rss "https://weather-broker-cdn.api.bbci.co.uk/en/forecast/rss/3day/2653822"
/usr/bin/wget -q -O observations.rss "https://weather-broker-cdn.api.bbci.co.uk/en/observation/rss/2653822"

/usr/bin/git commit -m 'Latest BBC Weather data' 3_day_forecast.rss observations.rss
/usr/bin/git push
