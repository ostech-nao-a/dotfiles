#!/bin/bash

echo ""
echo "exec => init.aws.sh"

echo ""
echo '    install aws-mfa from pip'
pip install aws-mfa

# aptのリポジトリの `awscli` は v2なので、一旦削除
echo ""
echo '    remove installed default awscli'
sudo apt remove -y awscli

# awscli v2のインストールはこの方法
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html
echo ""
echo '    install awscli-v2'
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo ""
echo '    install amazon ecr credential helper'
sudo apt update
sudo apt install -y amazon-ecr-credential-helper

echo ''
echo 'this script has been finished!!'
