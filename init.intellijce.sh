#!/bin/bash

echo ""
echo "exec => init.intellijce.sh"

IDEA_VERSION_DEFAULT="2023.2.3"
IDEA_VERSION=$IDEA_VERSION_DEFAULT
HELP=false

for opt in "$@"; do # in "$@" を省略して for opt と書くことも出来ます。
  case $opt in
    -s) IDEA_VERSION=$2; shift 2 ;;
    --set-version) IDEA_VERSION=$2; shift 2 ;;
    -h) HELP=true; shift 1 ;;
    --help) HELP=true; shift 1 ;;
    --) shift; break ;;
  esac
done

USAGE=$(
cat << EOH
Usage ./init.intellijce.sh [-s|--set-version]

OPTIONS:
  -s --set-version: set intellij idea version
                    format:  "yyyy.M.d"
                    default: ${IDEA_VERSION_DEFAULT}
EOH
)

if [ $HELP ] ; then
  echo 
  exit 0
fi

echo ""
echo '    download idea package'
curl -sSLO "https://download.jetbrains.com/idea/ideaIC-${IDEA_VERSION}.tar.gz"

echo ""
echo '    expand idea package'
sudo tar -xzf ideaIC-*.tar.gz -C /opt

echo ""
echo '    make symlink idea binary to /usr/bin'
cd /usr/bin
sudo ln -s "/opt/idea-IC-${IDEA_VERSION}/bin/idea.sh" idea

echo ""
echo 'finished script'
echo ""

