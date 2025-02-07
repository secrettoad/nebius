# Base image with necessary dependencies
FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    python3 \
    python3-pip \
    libomp-dev

# Clone llama.cpp repository
RUN git clone https://github.com/ggerganov/llama.cpp.git

# Build llama.cpp
WORKDIR /llama.cpp
RUN cmake -B build -DGGML_CUDA=ON
RUN cmake --build build --config Release

# Copy GGUF model to the container
COPY ./model.gguf /saved_models/model.gguf

# Expose necessary port for your server
EXPOSE 8080

# Command to run the llama.cpp server
CMD ["./build/bin/llama-server", "--model", "/saved_models/model.gguf", "--host", "0.0.0.0", "--port", "8080"]
##todo - next step is get a deployment and service up in nebius
##todo - use inference nodegroup - toggle on cuda for llama.cpp
##todo - add ingress controller if time (almost certainly not)