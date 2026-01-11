#!/bin/bash
set -e

wget https://github.com/PancakeTAS/lsfg-vk/releases/latest/download/lsfg-vk_noui.zip
unzip -o lsfg-vk_noui.zip -d "${HOME}/.local/"
rm -f lsfg-vk_noui.zip

[ -f "${HOME}/.local/share/vulkan/implicit_layer.d/VkLayer_LS_frame_generation.json" ] && \
    sed -i "s|\"liblsfg-vk.so\"|\"${HOME}/.local/lib/liblsfg-vk.so\"|g" "${HOME}/.local/share/vulkan/implicit_layer.d/VkLayer_LS_frame_generation.json"

if [ -d "${HOME}/.local/share/junkstore" ]; then
    ln -sf "${HOME}/.local/lib/liblsfg-vk.so" "${HOME}/.local/share/junkstore/lib/liblsfg-vk.so"
    ln -sf "${HOME}/.local/lib/liblsfg-vk.so" "${HOME}/.local/share/junkstore/compatlib/liblsfg-vk.so"
fi