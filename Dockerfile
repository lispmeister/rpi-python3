FROM resin/rpi-raspbian:jessie
MAINTAINER Markus Fix <lispmeister@gmail.com>

RUN apt-get update && apt-get install -y \
   build-essential \
   ca-certificates \
   git \
   libbz2-dev \
   libc6-dev \
   libgdbm-dev \
   libncursesw5-dev \
   libreadline-dev \
   libsqlite3-dev \
   libssl-dev \
   make \
   openssl \
   tk-dev \
   wget \
   zlib1g-dev \
   --no-install-recommends && \
   rm -rf /var/lib/apt/lists/*

# Build Python 3.5.1
WORKDIR /data
RUN wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz
RUN tar -zxvf Python-3.5.1.tgz
WORKDIR Python-3.5.1
RUN ./configure
RUN make -j4
RUN make install
RUN python3.5 --version
ENV PATH=/usr/local/bin:$PATH

# Install Pip
WORKDIR /data
RUN python3.5 -m ensurepip --upgrade
RUN pip3.5 --version

# Cleanup
RUN rm -rf /data/*
# Define default command
CMD ["bash"]

