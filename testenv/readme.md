# Test Environment

This `Vagrantfile` creates a Vagrant box `testenv` that serves as a test environment for

1. Deployment Automation code validation
1. Environment provisioners
1. Ansible roles or Puppet modules

A typical flow might be

1. Write code
1. Spin up the `testenv` box
1. Execute the code against the `testenv` box.
1. Run tests on the `testenv` box
1. Destroy `testenv` box.
