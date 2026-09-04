FROM runpod/comfyui:cuda12.8

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /workspace/runpod-slim/ComfyUI/custom_nodes

# KJNodes
RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git

# MiniMax H3 Turbo
RUN git clone https://github.com/larryvrh/ComfyUI-MiniMax-H3-Turbo.git && \
    cd ComfyUI-MiniMax-H3-Turbo && \
    git checkout 4274783

# RunPod Direct
RUN git clone https://github.com/MadiatorLabs/ComfyUI-RunpodDirect.git

# AlekPet
RUN git clone https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git

# rgthree
RUN git clone https://github.com/rgthree/rgthree-comfy.git

# Civicomfy
RUN git clone https://github.com/MoonGoblinDev/Civicomfy.git

# KJNodes dependencies
RUN pip install --no-cache-dir \
    -r /workspace/runpod-slim/ComfyUI/custom_nodes/ComfyUI-KJNodes/requirements.txt

# rgthree dependencies
RUN pip install --no-cache-dir \
    -r /workspace/runpod-slim/ComfyUI/custom_nodes/rgthree-comfy/requirements.txt

# MiniMax H3 Turbo
RUN pip install --no-cache-dir \
    -e /workspace/runpod-slim/ComfyUI/custom_nodes/ComfyUI-MiniMax-H3-Turbo

# RunPod Direct
RUN pip install --no-cache-dir \
    -e /workspace/runpod-slim/ComfyUI/custom_nodes/ComfyUI-RunpodDirect
