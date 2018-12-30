#!/bin/sh

# exit if anything fails
set -e

# update package version and create the build directory
npm version patch
mkdir -p ./build

# update zip.js with new version and run it
VERSION="$(node -p "require('./package.json').version")"
echo "${VERSION}"
sed -i bak -e "s|@VERSION@|${VERSION}|g" ./scripts/zip.js
node ./scripts/zip.js

# revert zip.js to original
sed -i bak -e "s|${VERSION}|@VERSION@|g" ./scripts/zip.js

git add .
git commit -m "new release: ${VERSION}"