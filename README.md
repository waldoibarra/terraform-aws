# Terraform and AWS Docker image

[![Build and push multi-platform image to Docker registry](https://github.com/waldoibarra/terraform-aws/actions/workflows/build-push-image.yml/badge.svg)](https://github.com/waldoibarra/terraform-aws/actions/workflows/build-push-image.yml)

This repository is meant for building/installing the Terraform and AWS CLIs in a Docker image for use for CI/CD pipelines such as GitHub Actions.

The Docker Hub repository can be found [here](https://hub.docker.com/r/waldoibarra/terraform-aws).

## CLIs versions

- Terraform version `1.3.6`.
- AWS version `1.25.97-r0`.

## How To Build And Push To Docker Hub Registry

There's a CI/CD pipeline as a GitHub Actions workflow in place, it is triggered when a new tag is pushed. Just do:

``` sh
git tag 1.1.1
git push --tags
```
