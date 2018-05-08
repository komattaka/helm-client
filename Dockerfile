FROM alpine

LABEL maintainer="komattaka <komattaka@gmail.com>"

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.url="https://github.com/komattaka/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/komattaka/helm-client" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV HELM_VERSION="v2.9.0"

RUN apk add --update ca-certificates \
  && apk add --update -t deps wget \
  && wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
  && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/local/bin \
  && apk del --purge deps \
  && rm /var/cache/apk/* \
  && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

ENTRYPOINT ["helm"]
CMD ["verison"]
