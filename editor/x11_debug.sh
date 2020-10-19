#!/bin/sh

cd ..
cd ..

scons p=x11 -j4 bits=64 target=debug deprecated=no tools=yes module_arkit_enabled="no" minizip="no" module_bmp_enabled="no" module_camera_enabled="no" module_csg_enabled="no" module_dds_enabled="no" module_gdnative_enabled="no" module_gridmap_enabled="no" module_jsonrpc_enabled="no" module_mobile_vr_enabled="no" module_ogg_enabled="no" module_opus_enabled="no" module_tga_enabled="no" module_theora_enabled="no" module_tinyexr_enabled="no" module_visual_script_enabled="no" module_vorbis_enabled="no" module_webm_enabled="no" module_webp_enabled="no" module_webrtc_enabled="no"
