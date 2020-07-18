#!/usr/bin/env bash

git pull

mkdir -p cardiff/darksky && cd cardiff/darksky
wget -q -O weather_new.json "https://api.darksky.net/forecast/256d6f395303ef80d4414e5a116279f1/51.4816,3.1791"
jq . weather_new.json > weather.json
rm weather_new.json

git commit -m 'Latest DarkSky Weather data for Cardiff' weather.json
git push
