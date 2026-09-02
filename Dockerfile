FROM runpod/worker-comfyui:5.6.0-base

WORKDIR /workspace/ComfyUI/custom_nodes

RUN git clone https://github.com/Larryvrh/ComfyUI-MiniMax-H3-Turbo.git
RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git
RUN git clone https://github.com/rgthree/rgthree-comfy.git
RUN git clone https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git

RUN pip install --no-cache-dir -r /workspace/ComfyUI/custom_nodes/ComfyUI-KJNodes/requirements.txt

RUN pip install --no-cache-dir googletrans==4.0.0-rc1
