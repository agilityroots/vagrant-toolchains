# vagrant-toolchains

Reusable Vagrant-based environments for
* demonstrations
* workshops: lab setup
* personal use (learning, development)

## Toolchain

|Tool | Use|
|-----|----|
| Vagrant | "Glue" for creating reusable development environments with different providers |
| Packer | Once development environments are validated, acts as a packaging mechanism |
| Terraform | Provisions packaged environments in different infrastructure |


Read READMEs inside each directory for details.

## References

1. [Packer Virtualbox cannot build from existing `.box` files](https://github.com/hashicorp/packer/issues/869)
1. [Packer Virtualbox ISO](https://www.packer.io/docs/builders/virtualbox-iso.html)
1. [Packer: read variables from a file](https://www.packer.io/docs/templates/user-variables.html#from-a-file)
