FROM golang:1.19.3-alpine AS tf-build

RUN apk add --no-cache git

RUN git clone --depth 1 --branch v1.3.6 https://github.com/hashicorp/terraform.git \
    && cd terraform \
    && go install

FROM alpine:3.17.0

COPY --from=tf-build /go/bin/terraform /usr/local/bin/

RUN apk add --no-cache aws-cli=1.25.97-r0 git

ENTRYPOINT ["terraform"]
