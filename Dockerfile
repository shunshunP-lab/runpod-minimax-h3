FROM runpod/worker-comfyui:5.6.0-base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /comfyui

RUN git fetch --all --tags && \
    git checkout v0.34.3

WORKDIR /comfyui/custom_nodes

RUN git clone https://github.com/MoonGoblinDev/Civicomfy.git

RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git

RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git && \
    cd ComfyUI-Manager && \
    git checkout 8d5a95d

RUN git clone https://github.com/larryvrh/ComfyUI-MiniMax-H3-Turbo.git && \
    cd ComfyUI-MiniMax-H3-Turbo && \
    git checkout 4274783

RUN git clone https://github.com/MadiatorLabs/ComfyUI-RunpodDirect.git && \
    cd ComfyUI-RunpodDirect && \
    git checkout a59de47

RUN git clone https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git

RUN git clone https://github.com/rgthree/rgthree-comfy.git

RUN pip install --no-cache-dir \
    -r /comfyui/custom_nodes/ComfyUI-KJNodes/requirements.txt

RUN pip install --no-cache-dir \
    -r /comfyui/custom_nodes/ComfyUI-Manager/requirements.txt

RUN pip install --no-cache-dir \
    -r /comfyui/custom_nodes/rgthree-comfy/requirements.txt

RUN pip install --no-cache-dir \
    -e /comfyui/custom_nodes/ComfyUI_Custom_Nodes_AlekPet

RUN pip install --no-cache-dir \
    -e /comfyui/custom_nodes/ComfyUI-MiniMax-H3-Turbo

RUN pip install --no-cache-dir \
    -e /comfyui/custom_nodes/Civicomfy

RUN pip install --no-cache-dir \
    -e /comfyui/custom_nodes/ComfyUI-RunpodDirect
