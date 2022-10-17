#!/usr/bin/env bash

read -p "User: " user
#read -p "Token: " token
current_dir=$(pwd)
mkdir /tmp/github
cd /tmp/github
#repos=$(curl -s https://api.github.com/users/$user/repos&access_token=$token | jq -r '.[]|.html_url')
repos=$(curl -s https://api.github.com/users/$user/repos | jq -r '.[]|.html_url')
ext=".git"
for repo in ${repos[@]}; do
git clone $repo$ext
done
cd /tmp
tar -cvf github.tar github
rm -rf github
cd $current_dir
mv /tmp/github.tar github.tar
clear
echo '========== Done! =========='
