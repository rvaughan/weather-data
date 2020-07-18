#!/usr/bin/env bash

/usr/bin/git pull

cd ..
mkdir -p cardiff/darksky && cd cardiff/darksky
/usr/bin/wget -q -O weather_new.json "https://api.darksky.net/forecast/256d6f395303ef80d4414e5a116279f1/51.4816,3.1791"
/usr/bin/jq . weather_new.json > weather.json
rm weather_new.json

/usr/bin/git commit -m 'Latest DarkSky Weather data for Cardiff' weather.json
/usr/bin/git push
