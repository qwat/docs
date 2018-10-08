#!/usr/bin/env bash

# Exit on error
set -e

if [ -z $1 ]
then
  TAG=master
else
  TAG=$1
fi

sed -i.bak -e "s/%%VERSION%%/$TAG/g" conf.py

TRANSLATIONS_I18N="en de fr it ro"

GNUMAKE="make"
if [[ "${OSTYPE,,}" =~ bsd* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
    GNUMAKE="gmake"
fi

${GNUMAKE} clean

if [ -f ~/.transifexrc ]; then
tx pull -a
fi
for LANG in $TRANSLATIONS_I18N
do
    ${GNUMAKE} -e SPHINXOPTS="-D language='${LANG}'" -e BUILDDIR="_build/html/${LANG}" html
done

cd _build/html

cat <<EOF > index.html
<html>
<head>
  <meta http-equiv="Refresh" content="0; url=en/html" />
</head>
<body>
  <p>You will be redirected to the English documentation</p>
</body>
</html>
EOF

touch .nojekyll
