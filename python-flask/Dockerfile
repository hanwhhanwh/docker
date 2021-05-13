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


COPY start-flask.sh /start-flask.sh
COPY requirements.txt /tmp/


WORKDIR "${FLASK_ROOT}"


RUN apk add --no-cache --virtual .build-deps gcc build-base musl-dev alpine-sdk \
		# Pillow dependencies
		freetype-dev fribidi-dev harfbuzz-dev jpeg-dev lcms2-dev openjpeg-dev tcl-dev tiff-dev tk-dev zlib-dev ; \
	apk add --no-cache freetype libpng libjpeg fribidi harfbuzz jpeg lcms2 openjpeg tcl tiff tk zlib ; \
	pip install -r /tmp/requirements.txt ; \
	apk del .build-deps gcc build-base musl-dev alpine-sdk \
		freetype-dev fribidi-dev harfbuzz-dev jpeg-dev lcms2-dev openjpeg-dev tcl-dev tiff-dev tk-dev zlib-dev ; \
	rm -f /var/cache/apk/* ; \
	mkdir -p "${FLASK_ROOT}"


EXPOSE 38080


CMD ["/start-flask.sh"]

