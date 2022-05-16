#!/usr/bin/env bash

if [[ $1 -eq "" ]]; then
  echo "Usage: $0"
  echo "  url: url to plugin"
  echo "ex: ./$0 https://github.com/leafgarland/typescript-vim"
  exit 1
fi

url=$1
name_of_plugin=$(echo $url | cut -d "/" -f 5)

echo "Installing $name_of_plugin ..."

git submodule add --name "$name_of_plugin" $url pack/bundle/opt/$name_of_plugin

echo "Add this to the init.lua file:"
echo "  SingularisArt.plugin.load(\"$name_of_plugin\")"
