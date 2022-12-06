FROM golang:1.19.3-alpine

RUN apk add --no-cache aws-cli=1.25.97-r0 git

RUN git clone --depth 1 --branch v1.3.6 https://github.com/hashicorp/terraform.git \
    && cd terraform \
    && go install

ENTRYPOINT ["terraform"]
