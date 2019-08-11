FROM jrpackages/jrnotes

ARG jr_pkg=jrSpatial

RUN apt-get update \
    && apt-get install -y \
    libudunits2-dev \
    libgdal-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/downloaded_packages/

RUN install2.r -n -1 -d TRUE -l /rpackages/ --error $jr_pkg \
    && rm -rf /tmp/downloaded_packages/

