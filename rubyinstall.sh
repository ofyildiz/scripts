#!/bin/sh

GEM_LIST=(
    jekyll
    bundler
    minima
)

for name in "${GEM_LIST[@]}"; do
    gem install $name
done
