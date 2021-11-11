
Initial size: 468MB

docker.cloudtrain.aws.msgoat.eu/cloudtrain/at41-docker-jre11 size: 275MB

Size of intermediate images:
```
PS C:\work\cloud-exp\minimal dockerfile\docker\docker> docker image history large-image:latest
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
eacba43d5a88        7 hours ago         CMD ["start-domain"]                            0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ENTRYPOINT ["./scripts/docker-entrypoint.sh"]   0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         EXPOSE map[4848/tcp:{} 8009/tcp:{} 8080/tcp:…   0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         RUN |10 ARG_PAYARA_HOME=/opt/payara ARG_PAYA…   5.8kB               buildkit.dockerfile.v0
<missing>           7 hours ago         COPY *.sh /opt/payara/scripts/ # buildkit       5.8kB               buildkit.dockerfile.v0
<missing>           7 hours ago         WORKDIR /opt/payara                             0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         USER payara                                     0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         RUN |10 ARG_PAYARA_HOME=/opt/payara ARG_PAYA…   193MB               buildkit.dockerfile.v0
<missing>           7 hours ago         ENV HOME_DIR=/opt/payara PAYARA_DIR=/opt/pay…   0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         LABEL maintainer=michael.theis@msg.group        0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_GID=1234                         0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_GROUP=payara                     0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_UID=1234                         0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_USER=payara                      0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_PKG_URL=https://search.maven.…   0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_VERSION=5.2021.7                 0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_DOMAIN_NAME=domain1              0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_ADMIN_PASSWORD=admin             0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_ADMIN_USER=admin                 0B                  buildkit.dockerfile.v0
<missing>           7 hours ago         ARG ARG_PAYARA_HOME=/opt/payara                 0B                  buildkit.dockerfile.v0
<missing>           3 weeks ago         /bin/sh -c echo "Update packages, install re…   31.2MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  LABEL maintainer=michael.…   0B
<missing>           3 weeks ago         /bin/sh -c echo Verifying install ...     &&…   0B
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV JAVA_HOME=/opt/java/o…   0B
<missing>           3 weeks ago         /bin/sh -c set -eux;     ARCH="$(dpkg --prin…   128MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV JAVA_VERSION=jdk-11.0…   0B
<missing>           3 weeks ago         /bin/sh -c apt-get update     && DEBIAN_FRON…   43.2MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV LANG=en_US.UTF-8 LANG…   0B
<missing>           3 weeks ago         /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:5d68d27cc15a80653…   72.8MB
```