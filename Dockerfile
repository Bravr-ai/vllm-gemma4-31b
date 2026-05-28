FROM vllm/vllm-openai:nightly

# Install ModelOpt for NVFP4 quantization
RUN pip install --no-cache-dir \
    nvidia-modelopt[all] \
    "starlette>=1.0.1" \
    && pip uninstall -y cupy-cuda12x 2>/dev/null || true

# Default working directory
WORKDIR /app

ENTRYPOINT ["vllm", "serve"]
