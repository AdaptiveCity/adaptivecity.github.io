#!/bin/bash

cp config/Gemfile .

bundle exec jekyll serve --livereload --host 0.0.0.0 -P 8080
