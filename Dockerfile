FROM ubuntu:18.04

LABEL maintainer="Prasant Jalan <prasant.jalan@gmail.com>"

RUN apt-get update --quiet -y

RUN apt-get install --quiet -y \
	perl \
	perl-modules \
	git \
	make \
	gcc \
	wget

# Download arm-gcc from ARM
RUN wget -q --show-progress \
	https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2?revision=bc2c96c0-14b5-4bb4-9f18-bceb4050fee7?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,7-2018-q2-update \
	-O gcc-arm-none-eabi.tar.bz2

# Create md5sum file
RUN echo "299ebd3f1c2c90930d28ab82e5d8d6c0 gcc-arm-none-eabi.tar.bz2" > gcc-arm-none-eabi.tar.bz2.md5

# Verify md5sum
RUN md5sum -c gcc-arm-none-eabi.tar.bz2.md5

# Untar the archive
RUN mkdir -p /opt/gcc-arm/
RUN tar -xjpf gcc-arm-none-eabi.tar.bz2 --strip-components=1 -C /opt/gcc-arm/

ENV PATH="/opt/gcc-arm/bin:${PATH}"

CMD "/bin/bash"

