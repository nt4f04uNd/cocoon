#!/bin/bash
# Copyright 2020 The Flutter Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Deploy a new flutter dashboard version to google cloud.

cp -r scheduler app_dart/build/
pushd app_dart > /dev/null
set -e
gcloud app deploy --project "$1" --version "version-$2" -q "$3" --no-stop-previous-version
gcloud app services set-traffic default --splits version-$2=1 --quiet
popd > /dev/null
