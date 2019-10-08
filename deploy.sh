#!/bin/bash
basePath=/usr/share/nginx

www-blog(){
repoName='xia-fei.github.io';
rm -rf $basePath/$repoName 
git clone https://github.com/xia-fei/${repoName}.git $basePath/$repoName

}

image-server(){
cd /tmp
git clone https://github.com/xia-fei/file-server.git
cd file-server
mvn package -Dmaven.test.skip=true
nohup java -Daccess.key.secret="QGWGUdG8wxbNTz1QCQ05SbNifXXZ7n" -Daccess.key.id="LTAIX3Mkmhdk2GeB" -Dserver.port=8002 -jar target/file-0.0.1-SNAPSHOT.jar >file-server.log 2>&1 &
}


sql(){
cd /tmp && \
git clone https://github.com/xia-fei/toolbox-web.git &&\
cd toolbox-web/sql-resolve && \
npm run build && \
rm -rf /usr/share/nginx/sql-resolve && \
cp -rf dist /usr/share/nginx/sql-resolve
}
www-blog
