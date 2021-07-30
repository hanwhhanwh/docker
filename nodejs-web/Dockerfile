FROM node:16-alpine3.14

# Labels
LABEL org.label-schema.build-date="$COMMIT_TIME" \
	org.label-schema.name="nodejs-web" \
	org.label-schema.description="NodeJS for HTTP Web service : Docker image running on Alpine Linux" \
	org.label-schema.vcs-ref="$CI_APPLICATION_TAG_SHORT" \
	org.label-schema.vcs-url="https://github.com/hanwhhanwh/docker" \
	org.label-schema.architecture="AMD64/x86_64" \
	org.label-schema.vendor="hanwhhanwh" \
	org.label-schema.maintainer="Wonhee Han <hbesthee@naver.com>" \
	org.label-schema.version="14.15" \
	org.label-schema.schema-version="1.0"


# Environments
ENV NODE_ENV=production \
	WEB_ROOT=/app/public \
	SERVICE_PORT=3000

COPY start-web.sh /start-web.sh

RUN set -ex; \
        mkdir -p ${WEB_ROOT}


WORKDIR "${WEB_ROOT}"

EXPOSE ${SERVICE_PORT}

CMD ["/start-web.sh"]
