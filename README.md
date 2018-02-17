# nVidia mining container 

## Contains

- Claymore dual miner ( https://bitcointalk.org/index.php?topic=1433925.0 )

## Requires

- Docker
- nVidia's docker engine ( https://github.com/NVIDIA/nvidia-docker )

## Run

```
docker run --name claymore -p 3336:3336 --runtime=nvidia --rm minuntu/nvidia-claymore-dual -platform 2 -esm 3 -allpools 1 -estale 0 -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 3FxDYFMeFVxo3TzKDvvWUmuLy6fAAp8ZJ6.nas01 -epsw x -dpool stratum+tcp://sia.eu.nicehash.com:3360 -dwal 3FxDYFMeFVxo3TzKDvvWUmuLy6fAAp8ZJ6.worker01 -dpsw x -dcoin sia -dcri 60 -mport 3336
```