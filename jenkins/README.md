# Jenkins + Nexus Server

This Vagrant box provisions a single Jenkins-based CI environment for use with Agility Roots Jenkins workshops.

## Toolchain Components

|Tool and Version |Purpose|
|----|-------|
|Jenkins 2.x | CI |
| Ansible 2.4 | Deployment Automation |
| Tomcat 8.5 | Application Server |
| Git 1.7 | Version Control |
| Docker 17.09-ce | Containerization |
| Maven 3.x | Build Automation |

## Features

1. *A good demonstration of infra-as-code*. Allows a functionally complete laboratory environment to be setup from scratch, on-demand, and torn down after use.

1. *Multiple Virtualization Environments.* AWS and Virtualbox are both supported. More virtualization technologies such as Hyper-V will be supported in the near future.

### Jenkins Server

This includes:
* Jenkins v2.32.x
* Most of the basic plugins, e.g
** git
** docker
** pipeline
** etc.

### Nexus Server

The Nexus server also runs as a Docker container, based on the latest Nexus image.

## How to build

### Using Packer

```
$ packer build \
  -only=virtualbox-ovf \
  -var-file=vars.json \
  packer-jenkins.json
