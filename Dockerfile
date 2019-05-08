FROM debian:stretch-slim

# Get Dependencies
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends apt-utils 
RUN apt-get -y install \
	build-essential pkg-config libcurl3-gnutls-dev libc6-dev libevent-dev m4 g++-multilib autoconf \
	libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev \
	libprotobuf-dev protobuf-compiler libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate

# Build
RUN git clone https://github.com/KomodoPlatform/komodo.git  /tmp/coin-daemon
WORKDIR /tmp/coin-daemon
RUN apt-get -y install curl


RUN ./zcutil/fetch-params.sh
RUN ./zcutil/build.sh -j$(nproc)

RUN mkdir -p /coin/data

WORKDIR /coin
RUN cp /tmp/coin-daemon/src/komodod ./komodod
RUN cp /tmp/coin-daemon/src/komodo-cli ./komodo-cli

EXPOSE 13000
EXPOSE 13001
CMD ./komodod --datadir=/coin/data
