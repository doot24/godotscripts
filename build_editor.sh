#!/bin/sh

read -p "platform: " PLATFORM
read -p "target (release_debug/debug): " TARGET
read -p "threads: " THREADS
read -p "modules:" MODULEARG

modules=$(<$MODULEARG)

if [ $TARGET == "debug" ] 
then 
  echo -e "\e[1;33m building debug version\e[0m"
  scons p=$PLATFORM bits=64 -j$THREADS target=$TARGET deprecated=no $modules

else
  echo -e "\e[1;33m building release version\e[0m"
  scons p=$PLATFORM bits=64 -j$THREADS use_lto=yes target=release_debug optimize=speed deprecated=no $modules
  cd bin
  strip godot.$PLATFORM.opt.tools.64
fi 
