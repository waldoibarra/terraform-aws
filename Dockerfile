FROM alpine:3.17.0 AS build

ARG BUILDPLATFORM
ARG TARGETPLATFORM
ENV TERRAFORM_VERSION=1.3.6

WORKDIR /terraform
RUN apk add --no-cache wget unzip
RUN export TERRAFORM_ZIP=terraform_${TERRAFORM_VERSION}_${TARGETPLATFORM/\//"_"}.zip \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_ZIP} \
    && unzip ${TERRAFORM_ZIP} -d /usr/local/bin

FROM alpine:3.17.0

COPY --from=build /usr/local/bin/terraform /usr/local/bin
RUN apk add --no-cache aws-cli=1.25.97-r0 git

ENTRYPOINT ["terraform"]
