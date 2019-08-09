#!/bin/bash
basePath=/usr/share/nginx

www-blog(){
repoName='xia-fei.github.io';
if [ ! -d $basePath/$repoName ]; then
git clone https://github.com/xia-fei/${repoName}.git $basePath/$repoName
else
cd $basePath/$repoName
echo $(pwd)
git pull 
fi
}

www-blog