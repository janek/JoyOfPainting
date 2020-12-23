#!/usr/local/bin/fish
# XXX: better shebang
for i in (seq 1 411); curl https://www.twoinchbrush.com/images/painting{500}.png --output {500}.png; end
