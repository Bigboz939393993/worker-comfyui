#!/usr/bin/env bash
set -e

echo "=== Installing system deps ==="
apt-get update
apt-get install -y ffmpeg git

echo "=== Installing custom nodes ==="
cd /workspace/ComfyUI/custom_nodes

# Video Helper Suite (for MP4 output)
if [ ! -d "ComfyUI-VideoHelperSuite" ]; then
  git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git
fi

# KJ Nodes (DiffusionModelLoaderKJ)
if [ ! -d "ComfyUI-KJNodes" ]; then
  git clone https://github.com/kijai/ComfyUI-KJNodes.git
fi

echo "=== Installing Python requirements ==="

if [ -f "ComfyUI-VideoHelperSuite/requirements.txt" ]; then
  pip install -r ComfyUI-VideoHelperSuite/requirements.txt
fi

if [ -f "ComfyUI-KJNodes/requirements.txt" ]; then
  pip install -r ComfyUI-KJNodes/requirements.txt
fi

echo "=== Custom nodes installed ==="
