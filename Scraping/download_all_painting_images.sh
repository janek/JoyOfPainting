#!/bin/sh
for i in $(seq 1 411); do curl https://www.twoinchbrush.com/images/painting{$i}.png --output painting$i.png; done
# XXX: a few images come out empty. We should filter them, otherwise it needs to be done as a manual step when adding to Xcode.
# XXX: put them in a folder
