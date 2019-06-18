FROM node:8.16-alpine

COPY assets /home/git/assets/

ENV GIT_GID=3030 \
	GIT_UID=3030

RUN apk upgrade --no-cache && \
    apk add --no-cache \
      vim \
      sudo \
      git \
      ruby ruby-bundler ruby-rdoc ruby-rake ruby-bigdecimal ruby-irb \
      mariadb-client \
      tzdata \
      procps \
      nginx \
      patch \
      dcron \
      logrotate \
; \
	addgroup -g $GIT_GID git
	adduser -u $GIT_UID -G git -s /bin/sh -g 'GitLab' -D git; \
    chown -R git:git /home/git; \
    ash -ex /home/git/assets/build/install.sh

EXPOSE 80/tcp 443/tcp

VOLUME ["/home/git/data","/var/log","/etc/gitlab/"]

ENTRYPOINT ["/home/git/assets/runtime/docker-entrypoint.sh"]
