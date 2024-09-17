#!/bin/bash

# Install jq to parse jsons
sudo apt-get update && sudo apt-get install jq -y

# Initialize Docker
#docker build -f ../../Dockerfile --tag=web_flag_command ../../
#docker run -p 1337:1337 -d -it web_flag_command

# Wait until docker is finished building to run this
until wget -q http://127.0.0.1:1337/api/options; do
	sleep 1
done

wget -O options http://127.0.0.1:1337/api/options
COMMAND=$(jq -r '.allPossibleCommands.secret[0]' options)
python3 solve.py "$(echo $COMMAND)"
