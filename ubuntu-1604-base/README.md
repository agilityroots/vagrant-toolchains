# Ubuntu 16.04 Base Box

* This is a customized Ubuntu 16.04 "base box".
* It serves as a basis for other customizations on top of it.

## Prerequisites

* Windows only
* Packer
* Virtualbox
* AWS Account

## Run a Vagrant Dev Environment (`vagrant up`)

Simply execute `vagrant up`.

## Build the Vagrant Box (`packer build`)

### Download a Vagrant Box

* To build Virtualbox `.box` files, Packer requires an `.ovf` file (See references section below).
* Add the following Vagrant box: [kmm/ubuntu-xenial64](https://app.vagrantup.com/kmm/boxes/ubuntu-xenial64/versions/1.0.1).

`vagrant box add kmm/ubuntu-xenial64 --provider=virtualbox --version=1.0.1`

* Verify that the box has been unpacked into `$HOMEDRIVE/$HOMEPATH/.vagrant.d/boxes` directory.
* Verify that the `ovf_source_path` path exists.

### Set Environment Variables

Look at [vars.json](vars.json) to understand what environment vars need to be set.

### Build all Base Boxes

```
packer build \
  -var-file=vars.json \
  packer-ubuntu-base.json
```

**Output:**

`.box` files, created in the same directory and named in the following format:

```
packer-ubuntu1604-base-2017-12-15-10-10-26_aws.box
packer-ubuntu1604-base-2017-12-15-10-10-26_virtualbox.box
```

### Build Base Box for Virtualbox Only

```
packer build \
  -var-file=vars.json \
 --only=virtualbox-ovf \
 packer-ubuntu-base.json
```
