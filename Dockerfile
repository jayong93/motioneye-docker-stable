FROM ubuntu:latest

EXPOSE 8765

RUN /bin/bash -c "apt update && apt upgrade -y && \
apt install -y python-pip python-dev curl libssl-dev \
libcurl4-openssl-dev libjpeg-dev motion ffmpeg v4l-utils && \
pip install motioneye && \
mkdir -p /var/lib/motioneye"

VOLUME /etc/motioneye /var/run/motion /var/lib/motioneye

ADD https://raw.githubusercontent.com/ccrisan/motioneye/dev/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
CMD /usr/local/bin/meyectl startserver -c /etc/motioneye/motioneye.conf

