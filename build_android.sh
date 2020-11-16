#!/bin/sh

read -p "target (release/debug): " TARGET
read -p "architecture (armv7/arm64v8): " ARCH
read -p "threads: " THREADS
read -p "optimize for (size/speed):" OPTIMIZE

#clean previous templates
cd platform/android/java
./gradlew cleanGodotTemplates
for i in `seq 3`; do cd ..; done

if [ $TARGET == "debug" ] 
then 
  echo -e "\e[1;33m building debug version\e[0m"
  scons p=android android_arch=$ARCH -j$THREADS target=$TARGET deprecated=no disable_3d=yes tools=no module_arkit_enabled=no module_bullet_enabled=no module_camera_enabled=no module_csg_enabled=no module_gdnavigation_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_visual_script_enabled=no module_assimp_enabled=no module_recast_enabled=no module_xatlas_unwrap_enabled=no module_websocket_enabled=no module_bmp_enabled=no module_dds_enabled=no module_jsonrpc_enabled=no module_tga_enabled=no module_vhacd_enabled=no module_tinyexr_enabled=no module_webp_enabled=no module_cvtt_enabled=no builtin_libwebp=no builtin_recast=no builtin_xatlas=no builtin_bullet=no builtin_wslay=no
  
  cd platform/android/java
  ./gradlew generateGodotTemplates
else
  echo -e "\e[1;33m building release version\e[0m"
  scons p=android android_arch=$ARCH tools=no -j$THREADS use_lto=yes debug_symbols=no target=$TARGET disable_3d=yes optimize=$OPTIMIZE deprecated=no module_arkit_enabled=no module_bullet_enabled=no module_camera_enabled=no module_csg_enabled=no module_gdnavigation_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_visual_script_enabled=no module_assimp_enabled=no module_recast_enabled=no module_xatlas_unwrap_enabled=no module_websocket_enabled=no module_bmp_enabled=no module_dds_enabled=no module_jsonrpc_enabled=no module_tga_enabled=no module_vhacd_enabled=no module_tinyexr_enabled=no module_webp_enabled=no module_cvtt_enabled=no builtin_libwebp=no builtin_recast=no builtin_xatlas=no builtin_bullet=no builtin_wslay=no
  
  cd platform/android/java
  ./gradlew generateGodotTemplates
fi 
