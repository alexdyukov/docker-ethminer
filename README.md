# docker-ethminer

Dockerized ethminer miner

## Requires

- [WSL](https://docs.microsoft.com/en-us/windows/ai/directml/gpu-cuda-in-wsl)
- [Linux](https://blog.roboflow.com/use-the-gpu-in-docker/)
- 4.5G+ VRAM (by 08.03.2022) to mine ETH

## Build
```
docker build -t docker-ethminer .
```

## Usage
```
docker run --gpus all --rm docker-ethminer -U -P stratum2+tcp://u00000000000.001:123456@ethash.poolbinance.com:443
```
