#!/bin/sh

read -p "platform: " PLATFORM
read -p "target (release_debug/debug): " TARGET
read -p "threads: " THREADS

if [ $TARGET == "debug" ] 
then f
  echo -e "\e[1;33m building debug version\e[0m"
  scons p=$PLATFORM bits=64 -j$THREADS target=$TARGET deprecated=no module_arkit_enabled=no module_bullet_enabled=no module_camera_enabled=no module_csg_enabled=no module_gdnavigation_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_visusal_script_enabled=no module_assimp_enabled=no module_recast_enabled=no module_xatlas_unwrap_enabled=no module_websocket_enabled=no module_bmp_enabled=no module_dds_enabled=no module_jsonrpc_enabled=no module_tga_enabled=no module_vhacd_enabled=no module_tinyexr_enabled=no module_webp_enabled=no module_cvtt_enabled=no builtin_libwebp=no builtin_recast=no builtin_xatlas=no

else
  echo -e "\e[1;33m building release version\e[0m"
  scons p=$PLATFORM bits=64 -j$THREADS use_lto=yes target=release_debug optimize=speed deprecated=no module_arkit_enabled=no module_bullet_enabled=no module_camera_enabled=no module_csg_enabled=no module_gdnavigation_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_visusal_script_enabled=no module_assimp_enabled=no module_recast_enabled=no module_xatlas_unwrap_enabled=no module_websocket_enabled=no module_bmp_enabled=no module_dds_enabled=no module_jsonrpc_enabled=no module_tga_enabled=no module_vhacd_enabled=no module_tinyexr_enabled=no module_webp_enabled=no module_cvtt_enabled=no builtin_libwebp=no builtin_recast=no builtin_xatlas=no
  cd bin
  strip godot.$PLATFORM.opt.tools.64
fi 
