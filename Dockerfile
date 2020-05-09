FROM nvidia/cuda:9.0-runtime

ENV CLAYMORE_GDRIVE_ID 1KoEyg1LVLbbioCj7hkHvVN71zoYaCr12 
ENV CLAYMORE_SHA256    a2df272888f70637a720fa904aa4af3945489fdab8b73a925369ae3d2b3d1f67
ENV CLAYMORE_VERSION   11.6 

# Install ccminer deps :
RUN apt-get update && apt-get install --no-install-recommends -y wget libcurl3 ca-certificates ocl-icd-libopencl1 && \
    apt-get clean && rm -Rf /var/lib/apt/lists

RUN mkdir /opt/claymore

# Default dir /opt/claymore
WORKDIR /opt/claymore

RUN echo ${CLAYMORE_SHA256} claymore.tar.gz > claymore.tar.gz.sha256
RUN wget -q "https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v11.8/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8.-.LINUX.tar.gz" -O claymore.tar.gz && \

    tar --strip=1 -xzvf claymore.tar.gz && \
    rm claymore.tar.gz

ENTRYPOINT [ "/opt/claymore/ethdcrminer64" ]
