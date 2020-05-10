FROM nvidia/cuda:10.0-runtime

# Install ccminer deps :
RUN apt-get update && apt-get install --no-install-recommends -y libcurl3 ca-certificates ocl-icd-libopencl1 git && \
    apt-get clean && rm -Rf /var/lib/apt/lists
	
RUN mkdir /opt/claymore

# Default dir /opt/claymore
WORKDIR /opt/claymore

RUN git clone https://github.com/ShazotiHashimoto/docker-nvidia-claymore-dual.git . 

RUN chmod +x *

CMD ["./ethdcrminer64 -epool stratum+tcp://daggerhashimoto.eu-new.nicehash.com:3353 -ewal 347i1EdYDG393J2XwRgB3mnw5HsyqsEW9N -epsw x -dbg -1 -retrydelay 1 -ftime 55 -tt 79 -ttli 77 -tstop 89 -tstart 85 -fanmin 30 -r 0 -esm 3 -estale 0 -erate 1"]