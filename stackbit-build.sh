#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db6a6b57b387100130ce42c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db6a6b57b387100130ce42c
curl -s -X POST https://api.stackbit.com/project/5db6a6b57b387100130ce42c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db6a6b57b387100130ce42c/webhook/build/publish > /dev/null
