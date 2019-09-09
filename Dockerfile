FROM jrpackages/jrnotes

ARG jr_pkg=jrSpatial

RUN install2.r -n -1 -d TRUE --error $jr_pkg \
    && rm -rf /tmp/downloaded_packages/

## Install phantomjs for leaflet graphics
## Need bzip2 to unzip
RUN apt-get update && \
    apt-get install -y bzip2 && \
    apt-get clean

RUN Rscript -e "webshot::install_phantomjs()" \
  && mv /root/bin/phantomjs /usr/bin/phantomjs \
  && chmod a+rx /usr/bin/phantomjs

