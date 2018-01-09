# Vagrant Toolchains

[![Gitter chat](https://badges.gitter.im/agilityroots/devopsyness.png)](https://gitter.im/agilityroots/devopsyness)
[![Twitter Follow](https://img.shields.io/twitter/follow/agilityroots.svg?style=social&label=Follow)](http://twitter.com/agilityroots)
[![Website](https://raw.githubusercontent.com/agilityroots/common/master/images/agile_logo_badge_visit_us_github.png)](http://www.agilityroots.com)

## What is this?

This repository contains reusable, virtualized, Vagrant-based DevOps environments.

**Why Vagrant?**

Vagrant makes it easy to create, provision and manage virtualized environments. [Read more here.](https://www.vagrantup.com/intro/index.html)

## List of Vagrant Boxes

The following Vagrant boxes have been released:

| Vagrant Box | Latest Release | Details |
|-|-|-|
| `jenkins` | [`2017-12-18`](https://github.com/agilityroots/vagrant-toolchains/releases/tag/2017-12-18-jenkins)| Prepackaged Jenkins environment. |
| `ubuntu1604-base` | [`2017-12-15`](https://github.com/agilityroots/vagrant-toolchains/releases/tag/2017-12-15-ubuntu1604-base) | Ubuntu-based environment designed for DevOps automation development.|

## How to Contribute

See [`contributing.md`](CONTRIBUTING.md).

## References

1. [Packer Virtualbox cannot build from existing `.box` files](https://github.com/hashicorp/packer/issues/869)
1. [Packer Virtualbox ISO](https://www.packer.io/docs/builders/virtualbox-iso.html)
1. [Packer: read variables from a file](https://www.packer.io/docs/templates/user-variables.html#from-a-file)
