#!/usr/bin/env bash
curl -s "https://wttr.in/?format=1" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//; s/[[:space:]]\{1,\}/ /g' > /tmp/weather.txt
