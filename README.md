# vLLM for Gemma 4 31B IT (NVFP4)

vLLM deployment of [nvidia/Gemma-4-31B-IT-NVFP4](https://huggingface.co/nvidia/Gemma-4-31B-IT-NVFP4) optimised for a single NVIDIA RTX PRO 6000 Blackwell GPU.

## Overview

- **Model**: Gemma 4 31B IT with NVFP4 quantization (ModelOpt)
- **Runtime**: vLLM (nightly) with OpenAI-compatible API
- **Context**: 262k tokens with chunked prefill and FP8 KV cache
- **Features**: Tool calling, reasoning, prefix caching

## Quick Start

1. Copy `.env.example` to `.env` and fill in your credentials:

   ```
   HUGGING_FACE_HUB_TOKEN=your_hf_token
   VLLM_API_KEY=your_api_key
   ```

2. Build and run:

   ```bash
   docker compose up -d --build
   ```

3. The API is available at `http://localhost:8005/v1` with the served model name `super`.

## Configuration

Key vLLM settings in `docker-compose.yaml`:

| Setting | Value |
|---|---|
| Quantization | NVFP4 (ModelOpt + CUTLASS) |
| Tensor parallel size | 1 |
| Max model length | 262,144 |
| KV cache dtype | FP8 |
| GPU memory utilisation | 95% |
| Max concurrent sequences | 8 |

## Network

The service joins an external Docker network `ai-net`. Create it before starting:

```bash
docker network create ai-net
```
