#!/bin/sh

# ##################################################
# Ruby Bundler Project Generator
version="1.0.0"
#
# HISTORY:
#
# * 17/06/12 - v1.0.0  - First Creation
#
# ##################################################

function mainScript() {
  bundle install --path vendor/bundle --binstubs
}

# Create Gemfile
cat << EOF > Gemfile
# frozen_string_literal: true
source "https://rubygems.org"

gem "rspec"
EOF

if [ ! -d ./lib ]; then
  mkdir lib
fi

if [ ! -d ./spec ]; then
  mkdir spec
fi

mainScript
