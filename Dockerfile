FROM  debian:bullseye

RUN set -x \

    # Runtime dependencies.

 && apt-get update \

 && apt-get upgrade -y \

    # Build dependencies.

 && apt-get install -y \ 

        autoconf \

        automake \

        curl \

        g++ \

        git \

        libcurl4-openssl-dev \

        libjansson-dev \

        libssl-dev \

        libgmp-dev \

        libz-dev \

        make \

        pkg-config
        

RUN set -x \

    # Compile from source code.

 && git clone https://github.com/litecoincash-project/cpuminer-multi.git \

 && cd /cpuminer-multi \

 && ./build.sh \

 #&& make install -j 4 \

    # Clean-up
 && apt-get purge --auto-remove -y \

        autoconf \

        automake \

        curl \

        g++ \

        git \

        make \

        pkg-config \

 && apt-get clean \

 
    # Verify

 #&& cpuminer --cputest \

 #&& cpuminer --version

WORKDIR /cpuminer-multi

COPY config.json /cpuminer-multi

EXPOSE 80

CMD ["cpuminer", "--config=config.json"]
