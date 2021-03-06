FROM nvidia/cuda:9.0-runtime

# Install ccminer deps :
	RUN apt-get update && apt-get install --no-install-recommends -y libcurl3 ca-certificates ocl-icd-libopencl1 git && \
		apt-get clean && rm -Rf /var/lib/apt/lists
	
	RUN mkdir /opt/claymore

# Default dir /opt/claymore
	WORKDIR /opt/claymore

	RUN git clone https://github.com/ShazotiHashimoto/docker-nvidia-claymore-dual.git . && \
		git checkout master && \
		chmod +x *
	CMD ["sh", "./15. Ethereum-nicehash.bash"]