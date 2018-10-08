#!/usr/bin/env bash
if [ -z $1 ]
then
  TAG="master"
else
  TAG=$1
fi

PUBLICATION_BRANCH=gh-pages
# Checkout the branch
REPO_PATH=$PWD

pushd $HOME

git clone --branch=$PUBLICATION_BRANCH https://${GITHUB_TOKEN}@github.com/qwat/docs.git publish 2>&1 > /dev/null
cd publish
# Update pages
git rm -rf $TAG 2>&1 > /dev/null
mkdir $TAG
cp -r $REPO_PATH/_build/html/* $TAG

# if necessary delete unused files
if [ -f config ]; then
  mkdir $HOME/.tx
  cp config $HOME/.tx/config
  cp $HOME/.transifexrc .

  cat $REPO_PATH/.tx/config | grep qwat-doc | sed 's/^\[//g' | sed 's/\]$//g' | sort > new_conf
  cat config | grep qwat-doc | sed 's/^\[//g' | sed 's/\]$//g' | sort > old_conf
  for f in $(diff -u old_conf new_conf | grep "\-qwat-doc" | sed 's/^.//g')
  do
    tx delete -r $f
  done
  rm new_conf old_conf
  rm -rf .tx .transifexrc
fi

# copy new tx config
cp $REPO_PATH/.tx/config .

# Commit and push latest version
git add .
git config user.name  "Travis"
git config user.email "travis@travis-ci.org"
git commit -m "Updated documentation."
git push -fq origin $PUBLICATION_BRANCH 2>&1 > /dev/null


popd
