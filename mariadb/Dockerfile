FROM alpine:3.13


ARG COMMIT_TIME
ARG CI_APPLICATION_TAG_SHORT


LABEL org.label-schema.build-date="$COMMIT_TIME" \
	org.label-schema.name="mariadb" \
	org.label-schema.description="MariaDB Docker image running on Alpine Linux" \
	org.label-schema.vcs-ref="$CI_APPLICATION_TAG_SHORT" \
	org.label-schema.vcs-url="https://github.com/hanwhhanwh/docker" \
	org.label-schema.architecture="AMD64/x86_64" \
	org.label-schema.vendor="hanwhhanwh" \
	org.label-schema.maintainer="Wonhee Han <hbesthee@naver.com>" \
	org.label-schema.version="10.6" \
	org.label-schema.schema-version="1.0"


# COPY docker-entrypoint.sh /usr/local/bin/
COPY sh/clean.sh /clean.sh
COPY sh/resolveip.sh /usr/bin/resolveip
COPY sh/run.sh /run.sh
COPY my.cnf /tmp/my.cnf


RUN set -ex ; \
# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
	addgroup -g 3306 mysql ; adduser -D -H -u 3306 -G mysql mysql ; \
# install latest mariadb
	apk add --no-cache mariadb ; \
# clean up
	/bin/sh /clean.sh ; \
	rm -f /var/cache/apk/* ; \
	touch /usr/share/mariadb/mysql_test_db.sql ; \
# allow anyone to connect by default
#	sed -i -e 's/127.0.0.1/%/' /usr/share/mariadb/mysql_system_tables_data.sql ; \
# purge and re-create /var/lib/mysql with appropriate ownership
	rm -rf /var/lib/mysql; \
	mkdir -p /var/lib/mysql /var/run/mysqld /etc/mysql/conf.d /run/mysql ; \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /etc/mysql/conf.d /run/mysql /usr/share/mariadb/mysql_system_tables_data.sql ; \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	chmod 777 /var/run/mysqld; \
# comment out a few problematic configuration values
	# find /etc/mysql/ -name '*.cnf' -print0 \
	# 	| xargs -0 grep -lE '^(bind-address|log)' \
	# 	| xargs -rt -0 sed -Ei 's/^(bind-address|log)/#&/'; \
# don't reverse lookup hostnames, they are usually another container
	echo -e "[mysqld]\nbind-address=0.0.0.0\nskip-host-cache\nskip-name-resolve\ndefault-time-zone='+9:00'" > /etc/my.cnf.d/docker.cnf ; \
# create scripts folders
	mkdir -p /docker-entrypoint-initdb.d ; \
	mkdir -p /scripts/pre-exec.d ; \
	mkdir -p /scripts/pre-init.d ; \
	chmod -R 755 /scripts


# RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
# ADD files/run.sh /scripts/run.sh


# This is not super helpful; mysqld might be running but not accepting connections.
# Since we have no clients, we can't really connect to it and check.
#
# Below is in my opinion better than no health check.
HEALTHCHECK --start-period=5s CMD pgrep mysqld


EXPOSE 3306


VOLUME ["/var/lib/mysql"]


USER mysql
# CMD ["mysqld"]


ENTRYPOINT ["/run.sh"]
