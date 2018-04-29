#!/bin/bash
# Basic while loop
connections=2000000
threads=2
while [ $connections -le 4000000 ]
do
echo Running wrk with 2 threads and $connections connections
wrk -t$threads -c$connections -s Benchmarking/MultiplePaths.lua http://localhost:3000/
connections=$(($connections + 100000))
done
echo Ran all tests
