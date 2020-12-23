#!/bin/sh
for i in $ $(seq 1 411); do curl https://www.twoinchbrush.com/images/painting{500}.png --output {500}.png; done
