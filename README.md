# fxa-relier-tests

Functional tests for Firefox Accounts OAuth reliers.

* [What's this?](#whats-this)
* [How does it work](#how-does-it-work)

## What's this?

We have functional tests in [fxa-content-server](https://github.com/mozilla/fxa-content-server),
which use a dummy project as an OAuth relier,
called [123done](https://github.com/mozilla/123done).
This repo is an experiment
to see if we can make those tests
more generally usable
to real reliers.

## How does it work?

There is a shell script, [run.sh](run.sh),
which clones the content server repo
and runs the OAuth tests against 123done.
If you set the environment variables
`FXA_TRUSTED_RELIER_URL` or `FXA_UNTRUSTED_RELIER_URL`,
it will try to run the same tests
against any URL of your choosing.
Right now that fails
because all of the element selectors
are hard-coded to work with 123done markup.
But if we could templatize those selectors,
we might get close to something usable.
