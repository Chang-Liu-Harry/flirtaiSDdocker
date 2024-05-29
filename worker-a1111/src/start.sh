#!/bin/bash

echo "Worker Initiated"

# Load LoRAs if required by the specific setup
export LORA_DIR=/stable-diffusion-webui/models/Lora

echo "Checking LoRA directory contents"
ls -l $LORA_DIR

echo "Starting WebUI API"
python /stable-diffusion-webui/webui.py --skip-python-version-check --skip-torch-cuda-test --skip-install --ckpt /model.safetensors --lowram --opt-sdp-attention --disable-safe-unpickle --port 3000 --api --nowebui --skip-version-check  --no-hashing --no-download-sd-model &

echo "Starting RunPod Handler"
python -u /rp_handler.py
