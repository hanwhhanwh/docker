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


WORKDIR "${FLASK_ROOT}"


RUN pip install -r requirements.txt


EXPOSE 38080


ENTRYPOINT ["python"]


CMD ["start-flask.sh"]

