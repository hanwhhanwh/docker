#!/bin/sh
set -eo pipefail

cd /app/public

pip install -r requirements.txt

echo "Flask ENV = flask run ${FLASK_DEBUG} --host=${FLASK_HOST} --port=${FLASK_PORT}"
python -m flask run ${FLASK_DEBUG} --host=${FLASK_HOST} --port=${FLASK_PORT}
