FROM python:alpine


LABEL org.label-schema.build-date="$COMMIT_TIME" \
	org.label-schema.name="python-flask" \
	org.label-schema.description="Python for Flask service : Docker image running on Alpine Linux" \
	org.label-schema.vcs-ref="$CI_APPLICATION_TAG_SHORT" \
	org.label-schema.vcs-url="https://github.com/hanwhhanwh/docker" \
	org.label-schema.architecture="AMD64/x86_64" \
	org.label-schema.vendor="hanwhhanwh" \
	org.label-schema.maintainer="Wonhee Han <hbesthee@naver.com>" \
	org.label-schema.version="1.0.0" \
	org.label-schema.schema-version="1.0"


ENV FLASK_HOST="0.0.0.0" \
	FLASK_PORT=38080 \
	FLASK_DEBUG="--no-debugger" \
	FLASK_ENV=production \
	FLASK_APP=server.py \
	FLASK_ROOT="/app/public"


COPY start-flask.sh /start-flask.sh \
	requirements.txt /tmp/requirements.txt


WORKDIR "${FLASK_ROOT}"


RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
	pip install -r /tmp/requirements.txt \
	apk del .build-deps gcc musl-dev \
	rm -f /var/cache/apk/* ; \
	mkdir -p "${FLASK_ROOT}"


EXPOSE 38080


CMD ["start-flask.sh"]

