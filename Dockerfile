FROM ubuntu:18.04

LABEL maintainer="Prasant Jalan <prasant.jalan@gmail.com>"

RUN apt-get update --quiet -y

RUN apt-get install --quiet -y \
	perl \
	perl-modules \
	git \
	make \
	gcc \
	gcc-arm-none-eabi

CMD "/bin/bash"

