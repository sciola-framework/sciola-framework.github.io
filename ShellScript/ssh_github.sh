#!/usr/bin/env sh
read -p "Enter the GitHub account username or email address: " github_user
filename="github"
cd ~
mkdir .ssh
cd .ssh
ssh-keygen -q -t rsa -b 4096 -C $github_user -N '' -f $filename
ssh-agent -s
ssh-add $filename
clear
echo ""
echo "1) Access the link: https://github.com/settings/keys"
echo ""
echo "- Click on the 'New SSH Key' button"
echo "- Enter the title"
echo "- Copy the following key:"
echo ""
cat $filename.pub
echo ""
echo "- Paste it into the 'Key' field and click the 'Add SSH Key' button"
echo ""
echo "2) Then run the following command:"
echo ""
echo "ssh -T git@github.com"
echo ""
echo "3) Go to your git project directory and run the following commands:"
echo ""
echo "git remote rm origin"
echo "git remote add origin git@github.com:<Your-User>/<Your-Repository>"
