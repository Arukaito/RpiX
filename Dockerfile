FROM resin/armv7hf-debian:stretch

LABEL io.resin.device-type="raspberrypi3"

RUN echo "deb http://archive.raspbian.org/raspbian stretch main contrib non-free rpi firmware" >>  /etc/apt/sources.list \
	&& apt-key adv --keyserver pgp.mit.edu  --recv-key 0x9165938D90FDDD2E \
	&& echo "deb http://archive.raspberrypi.org/debian stretch main" >>  /etc/apt/sources.list.d/raspi.list \
	&& apt-key adv --keyserver pgp.mit.edu  --recv-key 0x82B129927FA3303E

RUN apt-get update && apt-get install -y --no-install-recommends \
		less \
		libraspberrypi-bin \
		kmod \
		nano \
		net-tools \
		ifupdown \
		iputils-ping \
		i2c-tools \
		usbutils \		
	&& rm -rf /var/lib/apt/lists/*