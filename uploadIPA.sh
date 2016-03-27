#!/bin/bash


if [ $# -lt 1 ]; then
echo "请输入要上传的ipa文件名字"
exit 1
fi

if [ ! -f "./$1" ] ; then
echo "$1 not exist"
exit 1
fi

echo "上传ipa文件"

scp $1 root@123.56.156.203:/alidata/www/dev/feng/public/app_pack/

echo "ipa文件文件上传成功"

echo "修改config文件"

#http://xinmem.com/dev/feng/app_pack/petNiu_0225.ipa
sed -i "" "s/app_pack\/.*.ipa/app_pack\/$1/g" config.plist

echo "config文件修改成功"

echo "提交git"

git add config.plist

git commit -m "上传ipa文件 $1"
git pull origin master
git push origin master

echo "任务完成"
