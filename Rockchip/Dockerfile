FROM python:3.8-bullseye


LABEL org.label-schema.build-date="$COMMIT_TIME" \
	org.label-schema.name="python-rknn-toolkit2" \
	org.label-schema.description="Python for rknn-toolkit2 : Docker image running on RKNPU2" \
	org.label-schema.vcs-ref="$CI_APPLICATION_TAG_SHORT" \
	org.label-schema.vcs-url="https://github.com/hanwhhanwh/docker" \
	org.label-schema.architecture="AMD64/x86_64" \
	org.label-schema.vendor="hanwhhanwh" \
	org.label-schema.maintainer="Wonhee Han <hbesthee@naver.com>" \
	org.label-schema.version="1.0.0" \
	org.label-schema.schema-version="1.0"


WORKDIR "/home"


RUN	apt-get update && apt-get install -y libxslt1-dev zlib1g-dev libglib2.0 libsm6 libgl1-mesa-glx libprotobuf-dev gcc
# RUN	apt-get install libgl1-mesa-glx libegl1-mesa libgl1-mesa-dev
RUN rm -rf /var/lib/apt/lists/*
RUN	python3 -m pip install --upgrade pip

# first install numpy
RUN pip install numpy==1.19.5

ENV RKNN_TOOLKIT_FILE rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl

COPY ${RKNN_TOOLKIT_FILE} /tmp/
RUN pip install /tmp/${RKNN_TOOLKIT_FILE} ; rm -f /tmp/${RKNN_TOOLKIT_FILE}


# EXPOSE 38080


#COPY start-flask.sh /start-flask.sh
#COPY requirements.txt /tmp/


CMD ["python"]
