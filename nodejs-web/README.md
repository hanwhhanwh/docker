# 간단 사용법

해당 컨테이너를 이용하기 위해서는 반드시 start-web.sh 스크립트 파일을 작성하고,
작성된 start.sh 스크립트 파일을 마운트시켜주어야만 합니다.

또한 웹 서비스 소스 폴더를 '/app/public' 폴더로 마운트시켜주어야 합니다.

다음은 nodejs를 이용한 웹 서비스 컨테이너를 구동하는 예입니다.

```
docker run -d --restart always --name homepage \
	-v ${HOMEPAGE_ROOT_DIR}:/app/public \
	-v ./start-web.sh:/start-web.sh \
	-p 3000:3000 \
	hanwhhanwh/node:latest 2>&1
```


기본적으로 start-web.sh 스크립트는 다음과 같은 형식으로 작성합니다.

```
#!/bin/sh
set -eo pipefail

cd /app/public

# Check if a user is mounting their own web source
if [ -z "$(ls -A /app/public/node_modules/* 2> /dev/null)" ]; then
	# This needs to be install node modules
	npm install
fi

npm start
```
