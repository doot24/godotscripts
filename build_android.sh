#!/bin/sh

read -p "target (release/debug): " TARGET
read -p "architecture (armv7/arm64v8): " ARCH
read -p "threads: " THREADS
#read -p "optimize for (size/speed):" OPTIMIZE
read -p "modules:" MODULEARG

modules=$(<$MODULEARG)

#clean previous templates
cd platform/android/java
./gradlew cleanGodotTemplates
for i in `seq 3`; do cd ..; done

if [ $TARGET == "debug" ] 
then 
  echo -e "\e[1;33m building debug version\e[0m"
  scons p=android android_arch=$ARCH tools=no -j$THREADS target=$TARGET deprecated=no $modules
  
  cd platform/android/java
  ./gradlew generateGodotTemplates
else
  echo -e "\e[1;33m building release version\e[0m"
  scons p=android android_arch=$ARCH tools=no -j$THREADS use_lto=yes debug_symbols=no target=$TARGET deprecated=no $modules
  
  cd platform/android/java
  ./gradlew generateGodotTemplates
fi 
