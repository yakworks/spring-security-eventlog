#!/bin/bash

set -e

echo "### Running plugin tests ###"
(./gradlew clean check assemble --stacktrace)


if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_REPO_SLUG == "snimavat/spring-security-eventlog" && $TRAVIS_PULL_REQUEST == 'false' ]]; then
	echo "### publishing plugin to grails central"
	(./gradlew bintrayUpload)

else
  echo "Not on master branch, so not publishing"
  echo "TRAVIS_BRANCH: $TRAVIS_BRANCH"
  echo "TRAVIS_REPO_SLUG: $TRAVIS_REPO_SLUG"
  echo "TRAVIS_PULL_REQUEST: $TRAVIS_PULL_REQUEST"
fi

