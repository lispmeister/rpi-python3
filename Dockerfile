# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Markus Fix <lispmeister@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /data

# Define default command
CMD ["bash"]

# Default entrypoint
ENTRYPOINT ["/usr/bin/python3"]