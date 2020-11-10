#!/bin/sh
set -eo pipefail


# Check if a user is mounting their own web source
if [ -z "$(ls -A /app/public/node_modules/* 2> /dev/null)" ]; then
	# This needs to be install node modules
	npm install
fi

npm start
