#!/bin/bash
for plugin in packages/generator-superset/custom_plugins/*
do
  echo "Installing plugin $plugin"
  cd "$plugin"
  npm i
  npm run build
  cd ../../../../
done
