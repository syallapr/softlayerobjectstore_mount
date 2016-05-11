# Dockerfile : Mount Softlayer Object Store inside a container
# Version 1.0

# Pull base images
FROM ubuntu

# Set working directory
WORKDIR /root 

# Install Python
RUN apt-get update && \
apt-get -y upgrade

# Install pip
RUN apt-get install -y python-pip && \
pip install softlayer-object-storage

# Install cloudfuse
RUN apt-get install -y build-essential libcurl4-openssl-dev libxml2-dev libssl-dev libfuse-dev && \
apt-get install curl && \
curl -L https://github.com/redbo/cloudfuse/tarball/master > cloudfuse.tar && \
tar -xzvf cloudfuse.tar && \
apt-get install -y libjson0 libjson0-dev && \
cd redb* && \
./configure && \
make && \
make install


ENTRYPOINT ["/bin/bash"]