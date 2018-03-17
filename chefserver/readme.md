# Chef Server and Windows Node

This directory contains the Vagrant-based recipe for a Chef Server and Windows node hosted on Azure.

This recipe demonstrates several things

* Multiplatform, Multimachine `Vagrantfiles`.
* Vagrant on Azure. 


## Prerequisites

### Azure

* Install the `vagrant-azure` plugin.
* Get a valid Azure account.
* Create an Active Directory application first as described in the [documentation](https://github.com/Azure/vagrant-azure#create-an-azure-active-directory-aad-application) for `vagrant-azure`.

### Ansible

* Run this on a host machine with Linux and Ansible.
* Also since you are working with windows, make sure you install `pywinrm` with `pip install pywinrm`.


## Tips and Troubleshooting

### Run `vagrant up` in no-parallel mode.

(Known Issue: #15 )

:exclamation: If you try to bring up this Vagrant toolchain in parallel on Azure, the provisioning may fail.

This is because both machines may try to create the same resources, via simultaneous deployments to the same resource group. This could cause a race condition and a situation similar to:

![image](https://user-images.githubusercontent.com/27913105/37551903-1a4604da-29d0-11e8-8f70-ae8c47717974.png)

To fix this, run Vagrant up as follows:

```
vagrant up --no-parallel
```

[Reference on `--no-parallel`](https://www.vagrantup.com/docs/cli/up.html#no-parallel)

### Troubleshooting WinRM

Ansible provisioning might fail with 

```
fatal: [winnode01]: UNREACHABLE! => {
    "changed": false, 
    "msg": "ssl: HTTPSConnectionPool(host='winnode01.westus.cloudapp.azure.com', port=5986): Max retries exceeded with url: /wsman (Caused by SSLError(SSLError(\"bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)\",),))", 
    "unreachable": true
}

```

_How do you test your WinRM connection from a Linux host?_

[reference](http://www.tomsitpro.com/articles/setup-linux-to-query-windows-winrm-hosts,1-3468.html)

```
$ python

>>> import winrm
>>> session = winrm.Session('winnode01.westus.cloudapp.azure.com',auth=('azureuser','Password'))
>>> session.run_ps("hostname")


```

The possible cause could be that your `pywinrm` version is too recent - [reference](https://github.com/ansible/ansible/issues/34378).


## References

1. Multi-machine Vagrant - [1](https://blog.scottlowe.org/2016/01/18/multi-machine-vagrant-json/)
1. Ansible and Windows Nodes - [1](http://docs.ansible.com/ansible/latest/intro_windows.html)
1. Issues with `pywinrm` - [1](https://github.com/ansible/ansible/issues/34378)
