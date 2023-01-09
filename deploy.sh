#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e


commit_info=`git describe --all --always --long`
dist_path=docs/.vuepress/dist # 打包生成的文件夹路径

# 生成静态文件
npm run build

# 进入生成的文件夹
cd $dist_path

git init
git add -A
git commit -m "deploy, $commit_info"
git push -f git@github.com:JpypyJ/JBlog.git master:gh-pages

cd -
rm -rf $dist_path
