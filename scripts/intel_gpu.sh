#!/bin/bash

echo ">> Intel GPU setup"
echo "- install requirements..."

yay -S --needed \
	intel-compute-runtime \
	intel-level-zero-raytracing-support \
	intel-media-sdk \
	level-zero-headers \
	level-zero-loader \
	libva \
	libva-intel-driver \
	libva-utils \
	libvpl \
	lib32-libva \
	lib32-libva-intel-driver \
	lib32-mesa \
	lib32-vulkan-intel \
	mesa \
	nvtop \
	vpl-gpu-rt \
	vulkan-intel

echo "- setup flags to electron apps..."
cp -f flags/* ~/.config/
