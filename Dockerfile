FROM nvidia/cuda:9.0-runtime

ENV CLAYMORE_GDRIVE_ID 1sm-6Q0t_oE7g9t2tBPxj9IwlEdlPeqhn
ENV CLAYMORE_SHA256    15fd70dd9c8c1737d3a2f83b6da027f9208e633e8693df483a116b495de6c8f3

# Install ccminer deps :
RUN apt-get update && apt-get install --no-install-recommends -y wget libcurl3 ca-certificates ocl-icd-libopencl1 && \
    apt-get clean && rm -Rf /var/lib/apt/lists

RUN mkdir /opt/claymore

# Default dir /opt/claymore
WORKDIR /opt/claymore

RUN echo ${CLAYMORE_SHA256} claymore.tar.gz > claymore.tar.gz.sha256

RUN wget -q "https://docs.google.com/uc?id=${CLAYMORE_GDRIVE_ID}&export=download" -O claymore.tar.gz && \
    sha256sum -c claymore.tar.gz.sha256 && \
    tar --strip=1 -xzvf claymore.tar.gz && \
    rm claymore.tar.gz claymore.tar.gz.sha256

ENTRYPOINT /opt/claymore/ethdcrminer64
