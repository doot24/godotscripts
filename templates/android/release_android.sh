#!/bin/sh

cd ..
cd ..
cd ..

scons p=android -j2 android_arch=armv7 target=release deprecated=no debug_symbols=no separate_debug_symbols=no use_lto=yes tools=no disable_3d=yes optimize=size disable_advanced_gui=yes module_bmp_enabled=no module_bullet_enabled=no module_csg_enabled=no module_dds_enabled=no module_enet_enabled=no module_etc_enabled=no module_gdnative_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_mbedtls_enabled=no module_mobile_vr_enabled=no module_opus_enabled=no module_pvr_enabled=no module_recast_enabled=no module_squish_enabled=no module_tga_enabled=no module_thekla_unwrap_enabled=no module_theora_enabled=no module_tinyexr_enabled=no module_webm_enabled=no module_websocket_enabled=no module_visual_script_enabled=no module_regex_enabled=no

cd ..
cd ..
cd ..

cd platform/android/java
./gradlew generateGodotTemplates

