#!/usr/bin/env bash
if test "$TRAVIS_SECURE_ENV_VARS" = "true" -a "$TRAVIS_BRANCH" = "master";
then

  GNUMAKE="make"
  if [[ "${OSTYPE,,}" =~ bsd* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
      GNUMAKE="gmake"
  fi

  ${GNUMAKE} clean gettext

  sphinx-intl update-txconfig-resources --pot-dir _build/gettext --transifex-project-name qwat-doc

  tx push -s

else
  echo "  Not on master branch. Will not push to transifex."
fi
