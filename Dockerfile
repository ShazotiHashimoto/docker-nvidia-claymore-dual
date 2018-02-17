FROM nvidia/cuda:9.0-runtime

ENV CLAYMORE_GDRIVE_ID 1fWZ40uqEkFihDnf0kw8hYpobNRF1QCxc
ENV CLAYMORE_SHA256    9a703a79b0e75bf74850641f7d4031f4f757c5f6d45d3174838e524cac875e6d

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
