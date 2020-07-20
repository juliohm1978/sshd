FROM ubuntu:20.04

ARG SSHD_VERSION=
ENV SSHD_VERSION=${SSHD_VERSION}
ENV TZ=America/Sao_Paulo

RUN addgroup user --gid 1000 \
    && adduser user --uid 1000 --gid 1000 \
    && echo "user:user" | chpasswd \
    && echo "root:root" | chpasswd

RUN mkdir /run/sshd

COPY rootfs /

VOLUME ["/etc/ssh"]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

CMD [ "-D", "-4", "-e" ]
