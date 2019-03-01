#!/bin/sh

if [ "$FXA_TRUSTED_RELIER_URL" = "" ]; then
  FXA_TRUSTED_RELIER_URL="https://123done-latest.dev.lcip.org/"
fi

if [ "$FXA_UNTRUSTED_RELIER_URL" = "" ]; then
  FXA_UNTRUSTED_RELIER_URL="https://321done-latest.dev.lcip.org/"
fi

if [ ! -d fxa-content-server ]; then
  git clone https://github.com/mozilla/fxa-content-server.git
  cd fxa-content-server
else
  cd fxa-content-server
  git pull
fi

npm ci

node tests/intern --suites=oauth --fxaProduction=true --fxaContentRoot=https://latest.dev.lcip.org/ --fxaAuthRoot=https://latest.dev.lcip.org/auth/v1 --fxaEmailRoot=http://restmail.net "--fxaOAuthApp=$FXA_TRUSTED_RELIER_URL" "--fxaUntrustedOauthApp=$FXA_UNTRUSTED_RELIER_URL"
STATUS=$?

cd -

exit $STATUS
