#!/bin/sh

printf "READY\n";

while read line; do
  kill -3 $(cat "/var/run/supervisord.pid")
done < /dev/stdin
