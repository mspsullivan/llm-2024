#!/bin/bash


# Initialize Docker
# run start_docker.sh not these.
#docker build -f ../../Dockerfile --tag=web_title2 ../../
#docker run -p 3000:3000 -d web_title2

# Wait until docker is finished building to run this
until wget -q http://127.0.0.1:3000/#/ 
do
	sleep 1
done

curl -s http://127.0.0.1:3000/#/ -o page.html
grep -o '<title>.*</title>' page.html | sed 's/<title>\(.*\)<\/title>/\1/'
